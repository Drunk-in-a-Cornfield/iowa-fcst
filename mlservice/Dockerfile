# https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/
# https://stackoverflow.com/questions/44342741/auto-reloading-flask-server-on-docker

FROM python:3.8-slim-buster

RUN pip3 install flask
RUN pip3 install psycopg2-binary
RUN pip3 install seaborn pandas matplotlib sklearn
WORKDIR app
COPY * /app/
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4000"]