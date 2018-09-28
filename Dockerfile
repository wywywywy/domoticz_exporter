FROM node:8-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm i -g npm

COPY package*.json /usr/src/app/
RUN npm ci

COPY domoticz_exporter.js /usr/src/app/

EXPOSE 9486
ENV DOMOTICZ_PORT=9486 DEBUG=0 DOMOTICZ_HOSTIP=127.0.0.1 DOMOTICZ_HOSTPORT=8080

ENTRYPOINT [ "npm", "start" ]