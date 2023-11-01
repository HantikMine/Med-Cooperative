from flask import Flask
import os
app = Flask(__name__)

app.config["MYSQL_HOST"] = os.getenv("MYSQL_HOST")
SECRET_KEY = 'ajbsdiuabsidubasdiubasihdasdasdasd'
MYSQL_USER = 'user'
MYSQL_PASSWORD = 'password'
MYSQL_DATABASE = 'std_2191_exam'


ADMINISTRATOR_ROLE_ID = 1
MODERATOR_ROLE_ID = 2