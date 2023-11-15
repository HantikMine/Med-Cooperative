from flask import Blueprint, render_template, request, redirect, url_for, flash, current_app, flash
from flask_login import LoginManager, UserMixin, login_user, logout_user, login_required, current_user

bp = Blueprint('auth', __name__, url_prefix='/auth')


from app import db

def load_user(user_id):
    query = "SELECT * FROM doctor WHERE id = %s;"
    with db.connection.cursor(named_tuple = True) as cursor:
        cursor.execute(query, (user_id,))
        user = cursor.fetchone()
    return user

class User(UserMixin):
    def __init__(self, id, login, name):
        self.id = id
        self.login = login
        self.name = name
        
def authentificate_user(login, password):
    query = "SELECT * FROM doctor WHERE login = %s AND password_hash	= SHA2(%s, 256);"
    with db.connection.cursor(named_tuple = True) as cursor:
        cursor.execute(query, (login, password))
        db_user = cursor.fetchone()
    if db_user is not None:
        user = User(db_user.id, db_user.login, db_user.name)
        return user
    return None

def load_user(user_id):
    query = "SELECT * FROM doctor WHERE id = %s;"
    cursor = db.connection.cursor(named_tuple = True)
    cursor.execute(query, (user_id,))
    db_user = cursor.fetchone()
    cursor.close()
    if db_user is not None:
        user = User(user_id, db_user.login, db_user.name)
        return user
    return None


def init_login_manager(app):
    login_manager = LoginManager()
    login_manager.init_app(app)
    login_manager.login_view = 'auth.login'
    login_manager.login_message = 'Для доступа к этой странице необходимо пройти процедуру аутентификации.'
    login_manager.login_message_category = 'warning'
    login_manager.user_loader(load_user)

@bp.route('/login', methods = ['POST', 'GET'])
def login():
    if request.method == "POST":
        user_login = request.form["loginInput"]
        user_password = request.form["passwordInput"]
        remember_me = request.form.get('remember_me') == 'on'


        auth_user = authentificate_user(user_login, user_password)
        if auth_user:
            login_user(auth_user, remember=remember_me)
            flash("Вы успешно авторизованы", "success")
            next_ = request.args.get('next')
            return redirect(next_ or url_for("index"))
            
        flash("Введены неверные логин и/или пароль", "danger") 


    return render_template('login.html')

@bp.route('/logout')
def logout():
    logout_user()
    return redirect(url_for("index"))
