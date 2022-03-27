# https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/

FROM python:3.8-slim-buster

RUN pip3 install flask
WORKDIR /python-docker
COPY . .
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4000"]