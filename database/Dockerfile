FROM postgres:latest

# add 'll' command to bash
RUN echo "alias ll='ls -alF --group-directories-first'" >> /root/.bashrc

COPY ./create_table_salesdata.sql /docker-entrypoint-initdb.d/

RUN apt-get update && apt-get  install -y postgresql-14-postgis-3  
CMD ["/usr/local/bin/docker-entrypoint.sh","postgres"]