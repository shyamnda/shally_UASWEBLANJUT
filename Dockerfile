FROM python:alpine3.19

ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache \
    mariadb-connector-c-dev \
    gcc \
    musl-dev \
    libffi-dev \
    && pip install gunicorn \
    && pip install mysqlclient

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app/
