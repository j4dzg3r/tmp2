#!/bin/sh

python django_project/manage.py migrate --no-input
python django_project/manage.py collectstatic --no-input
gunicorn django_project.wsgi:application --bind 0.0.0.0:8080