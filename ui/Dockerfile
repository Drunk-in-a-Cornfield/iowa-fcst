# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

FROM node:16-alpine3.14

RUN echo "alias ll='ls -alF --group-directories-first'" >> /root/.profile

# wait for postgrres to be ready before continuing
# https://www.datanovia.com/en/lessons/docker-compose-wait-for-container-using-wait-tool/docker-compose-wait-for-postgres-container-to-be-ready/
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

# mount host directory to container
# enables editing UI files on host -> immediately reflected in container and express server
VOLUME ["/usr/src/app"]

WORKDIR /usr/src/app
