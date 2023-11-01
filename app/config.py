import os
SECRET_KEY = 'ajbsdiuabsidubasdiubasihdasdasdasd'

MYSQL_DATABASE_USER = 'user'
MYSQL_DATABASE_PASSWORD = 'password'
MYSQL_DATABASE_DB = 'std_2191_exam'
MYSQL_DATABASE_HOST = os.getenv('MYSQL_HOST', 'db')

ADMINISTRATOR_ROLE_ID = 1
MODERATOR_ROLE_ID = 2