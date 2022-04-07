FROM postgres:latest

# add 'll' command to bash
RUN echo "alias ll='ls -alF --group-directories-first'" >> /root/.bashrc

COPY ./create_table_salesdata.sql /docker-entrypoint-initdb.d/
