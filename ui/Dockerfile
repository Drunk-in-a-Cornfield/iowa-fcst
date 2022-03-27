# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

FROM node:16-alpine3.14

WORKDIR /usr/src/app

# copy package.json and install packages
COPY package*.json ./
RUN npm install

# copy application source code into container
COPY . .

CMD [ "node", "server.js"]