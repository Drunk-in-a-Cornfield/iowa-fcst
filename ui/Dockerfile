# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

FROM node:16-alpine3.14

RUN echo "alias ll='ls -alF --group-directories-first'" >> /root/.profile

# mount host directory to container
# enables editing UI files on host -> immediately reflected in container and express server
VOLUME ["/usr/src/app"]

WORKDIR /usr/src/app

CMD [ "npm", "start"]