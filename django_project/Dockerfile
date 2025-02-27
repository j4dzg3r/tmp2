FROM python:3.13-alpine

WORKDIR /app

COPY ./django_project /app

RUN pip install -r requirements.txt

RUN chmod +x entrypoint.sh

CMD [ "./entrypoint.sh" ]
