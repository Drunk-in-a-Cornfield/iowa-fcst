# https://www.freecodecamp.org/news/how-to-dockerize-a-flask-app/
# https://stackoverflow.com/questions/44342741/auto-reloading-flask-server-on-docker

FROM python:3.8-slim-buster

# add 'll' command to bash
RUN echo "alias ll='ls -alF --group-directories-first'" >> /root/.bashrc

RUN pip3 install flask
RUN pip3 install psycopg2-binary
RUN pip3 install seaborn pandas matplotlib sklearn sqlalchemy

# wait for postgrres to be ready before continuing
# https://www.datanovia.com/en/lessons/docker-compose-wait-for-container-using-wait-tool/docker-compose-wait-for-postgres-container-to-be-ready/
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

# mount host directory to container
# enables editing python files on host -> immediately reflected in container and flask server
VOLUME ["/usr/src/app"]

WORKDIR /app
