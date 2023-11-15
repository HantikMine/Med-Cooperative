FROM python:3.9-slim-buster

COPY ./mysql/privileges.sql /docker-entrypoint-initdb.d/

WORKDIR /app

RUN apt-get update && apt-get install python3-dev default-libmysqlclient-dev gcc  -y \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]