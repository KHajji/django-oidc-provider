FROM python:latest

COPY . .
RUN python -m pip install -r requirements.txt --no-cache-dir
RUN python -m pip install . --no-cache-dir

RUN [ "python", "./example/manage.py", "migrate" ]
RUN [ "python", "./example/manage.py", "creatersakey" ]
EXPOSE 3000
CMD python ./example/manage.py runserver 0.0.0.0:3000
