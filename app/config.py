from flask import Flask

app = Flask(__name__)

SECRET_KEY = 'ajbsdiuabsidubasdiubasihdasdasdasd'
MYSQL_USER = 'user'
MYSQL_PASSWORD = 'password'
MYSQL_DATABASE = 'std_2191_exam'
app.config["MYSQL_HOST"] = "${MYSQL_HOST}"



ADMINISTRATOR_ROLE_ID = 1
MODERATOR_ROLE_ID = 2