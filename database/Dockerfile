FROM postgres:latest

# add 'll' command to bash
RUN echo "alias ll='ls -alF --group-directories-first'" >> /root/.bashrc

COPY ./create_table_salesdata.sql /docker-entrypoint-initdb.d/

# install postgresql-14-postgis-3
RUN apt-get update && apt-get install -y postgresql-14-postgis-3

# install python
RUN apt-get -y install python3 python3-pip

# install dependencies for features_by_store.py
RUN apt-get -y install libpq-dev
RUN python3 -m pip install sqlalchemy pandas psycopg2

CMD ["/usr/local/bin/docker-entrypoint.sh","postgres"]