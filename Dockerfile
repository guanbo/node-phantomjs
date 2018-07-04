FROM node:8-alpine

RUN apk update
RUN apk add tzdata

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /home/app/exports
WORKDIR /home/app

COPY package.json /home/app/package.json
# COPY package-lock.json /home/app/package-lock.json

RUN npm install