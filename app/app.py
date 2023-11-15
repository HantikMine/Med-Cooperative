from flask import Flask, render_template, session, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from mysql_db import MySQL
import mysql.connector

app = Flask(__name__)
application = app

PERMITTED_PARAMS = ["name", "method", "assumption", "sideeffects"]

app.config.from_pyfile('config.py')
db = MySQL(app)

from auth import bp as bp_auth, init_login_manager
init_login_manager(app)
app.register_blueprint(bp_auth)

@app.route('/')
def index():
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
        test = date!=None and len(date)>0
        if test:
            query += " WHERE card.date = %s"
            date_object = datetime.strptime(date, '%d.%m.%Y').date()
            query_params.append(date_object)
        if disease!=None and len(disease)>0:
            query += " AND" if test else " WHERE"
            query += " disease.name = %s"
            query_params.append(disease)
        with db.connection.cursor(named_tuple = True) as cursor:
            cursor.execute(query, query_params,)
            cards = cursor.fetchall()
    except:
        flash("Дата должна быть указана в формате %d.%m.%Y",'danger')
    return render_template('cards.html', cards = cards, date = date, disease = disease)

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
        query = """
        INSERT INTO drug (name, method, assumption, sideeffects) 
        VALUES (%s, %s, %s, %s);
        """
        with db.connection.cursor(named_tuple = True) as cursor:
                    cursor.execute(query,(cur_params['name'],cur_params['method'],cur_params['assumption'],cur_params['sideeffects'],)) 
                    db.connection.commit()
                    book_id = cursor.lastrowid

        flash(f"Лекарство '{cur_params['name']}' успешно добавлено", "success")
    except Exception as err:
        db.connection.rollback()
        print(err)
        flash("При добавлении возникла ошибка", "danger")
        return render_template("add.html", drug = drug)
    return redirect(url_for('drugs'))

@app.route('/drugs', methods=['GET','POST'])
@login_required
def drugs():
    query = "SELECT * FROM drug"
    drugs = []
    query_params = []
    drug = request.form.get('drug')
    if drug!=None and len(drug)>0:
        query += " WHERE drug.name = %s"
        query_params.append(drug)
    with db.connection.cursor(named_tuple = True) as cursor:
            cursor.execute(query, query_params,)
            drugs = cursor.fetchall()
    return render_template('drugs.html', drugs = drugs, drug=drug)
