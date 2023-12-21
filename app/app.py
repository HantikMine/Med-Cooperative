from flask import Flask, render_template, session, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from mysql_db import MySQL
import mysql.connector

from prometheus_client import generate_latest
from prometheus_client import Counter
from prometheus_client import Summary

# Create a metric to track time spent and requests made.
INDEX_TIME = Summary('index_request_processing_seconds', 'DESC: INDEX time spent processing request')

# Create a metric to count the number of runs on process_request()
c = Counter('requests_for_host', 'Number of runs of the process_request method', ['method', 'endpoint'])

app = Flask(__name__)
application = app

PERMITTED_PARAMS = ["name", "method", "assumption", "sideeffects"]

app.config.from_pyfile('config.py')
db = MySQL(app)

from auth import bp as bp_auth, init_login_manager
init_login_manager(app)
app.register_blueprint(bp_auth)

@app.route('/')
@INDEX_TIME.time()
def index():
    path = str(request.path)
    verb = request.method
    label_dict = {"method": verb,
                 "endpoint": path}
    c.labels(**label_dict).inc()
    return render_template('index.html')


@app.route('/cards', methods=['GET','POST'])
@login_required
def cards():
    date = request.form.get('date')
    disease = request.form.get('disease')
    query = """
            SELECT card.id, card.date, card.address, card.symptoms,
                doctor.name AS doctor_name, patient.name AS patient_name,
                disease.name AS disease_name, drug.name AS drug_name
            FROM card
            JOIN doctor ON card.doctor_id = doctor.id
            JOIN patient ON card.patient_id = patient.id
            JOIN disease ON card.disease_id = disease.id
            JOIN drug ON card.drug_id = drug.id
            """
    cards = []
    try:
        query_params = []
        test = date is not None and len(date) > 0
        if test:
            query += " WHERE DATE_FORMAT(card.date, '%d.%m.%Y') LIKE %s"
            query_params.append(f"%{date}%")

        if disease is not None and len(disease) > 0:
            query += " AND" if test else " WHERE"
            query += " disease.name LIKE %s"
            query_params.append(f"%{disease}%")

        with db.connection.cursor(named_tuple=True) as cursor:
            cursor.execute(query, query_params)
            cards = cursor.fetchall()

    except:
        flash("Дата должна быть указана в формате %d.%m.%Y", 'danger')

    return render_template('cards.html', cards=cards, date=date, disease=disease)

@app.route('/add_drug', methods=['GET'])
@login_required
def add_drug():
    return render_template("add_drug.html", drug = {})

def getParams(names_list):
    result = {}
    for name in names_list:
        result[name] = request.form.get(name) or None 
    return result

@app.route('/create_drug',methods=['POST'])
@login_required
def create_drug():
    cur_params = getParams(PERMITTED_PARAMS)
    drug = {}
    for param in cur_params:
        drug[param]=cur_params[param]
    for param in cur_params:
        if cur_params[param]==None:
            flash("Указаны не все параметры", "danger")
            return render_template("add_drug.html", drug = drug)

    try:
        query = "SELECT * FROM drug WHERE name = %s;"
        with db.connection.cursor(named_tuple = True) as cursor:
                    cursor.execute(query,(cur_params['name'],)) 
                    res = cursor.fetchone()
        if res and res.deleted_at:
            query = "UPDATE drug SET name=%s, method=%s, assumption=%s, sideeffects=%s, deleted_at=NULL WHERE name=%s;"
        else:          
            query = """
                    INSERT INTO drug (name, method, assumption, sideeffects, deleted_at) 
                    VALUES (%s, %s, %s, %s, NULL);
                    """
        with db.connection.cursor(named_tuple = True) as cursor:
                if res and res.deleted_at:
                    cursor.execute(query,(cur_params['name'],cur_params['method'],cur_params['assumption'],cur_params['sideeffects'],cur_params['name'],))
                else:
                    cursor.execute(query,(cur_params['name'],cur_params['method'],cur_params['assumption'],cur_params['sideeffects'],)) 
                db.connection.commit()

        flash(f"Лекарство '{cur_params['name']}' успешно добавлено", "success")
    except Exception as err:
        db.connection.rollback()
        print(err)
        flash("При добавлении возникла ошибка", "danger")
        redirect(url_for('drugs'))
    return redirect(url_for('drugs'))

@app.route('/delete_drug/<int:drug_id>/<string:drug_name>',methods=['POST'])
@login_required
def delete_drug(drug_id, drug_name):
    try:
        query = """
                UPDATE drug
                SET deleted_at = CURRENT_TIMESTAMP
                WHERE id = %s;
                """
        with db.connection.cursor(named_tuple = True) as cursor:
                    cursor.execute(query,(drug_id,)) 
                    db.connection.commit()
        flash(f'Лекарство {drug_name} успешно удалено', 'success')
    except:
        db.connection.rollback()
        flash(f'Ошибка при удалении лекарства {drug_name}', 'danger')    
    return redirect(url_for('drugs'))


@app.route('/drugs', methods=['GET','POST'])
@login_required
def drugs():
    query = "SELECT * FROM drug WHERE drug.deleted_at IS NULL"
    drugs = []
    query_params = []
    drug = request.form.get('drug')
    if drug is not None and len(drug) > 0:
        query += " AND drug.name LIKE %s"
        query_params.append(f"%{drug}%")

    with db.connection.cursor(named_tuple = True) as cursor:
            cursor.execute(query, query_params,)
            drugs = cursor.fetchall()
    return render_template('drugs.html', drugs = drugs, drug=drug)

@app.route('/test')
@INDEX_TIME.time()
def index():
    path = str(request.path)
    verb = request.method
    label_dict = {"method": verb,
                 "endpoint": path}
    c.labels(**label_dict).inc()
    return render_template('index.html')

@app.route('/metrics')
def metrics():
    return generate_latest()
