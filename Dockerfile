FROM node:14-alpine

RUN mkdir -p /app
WORKDIR /app

RUN npm i -g npm@6

COPY package*.json /app/
RUN npm ci

COPY domoticz_exporter.js /app/

EXPOSE 9486
ENV DOMOTICZ_PORT=9486 DOMOTICZ_INTERVAL=15 DOMOTICZ_HOSTIP=127.0.0.1 DOMOTICZ_HOSTPORT=8080 DEBUG=0 

ENTRYPOINT [ "npm", "start" ]