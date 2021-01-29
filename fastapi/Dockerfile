FROM tiangolo/uvicorn-gunicorn:python3.8-alpine3.10

RUN apk update && apk add gcc libc-dev

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY ./app /app