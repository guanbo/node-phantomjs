FROM node:8-alpine

RUN apk update
RUN apk add tzdata

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 2: Download+Install PhantomJS, as the npm package 'phantomjs-prebuilt' won't work on alpine!
# See https://github.com/dustinblackman/phantomized
RUN set -ex \
  && apk add --no-cache --virtual .build-deps ca-certificates openssl \
  && wget -qO- "https://github.com/dustinblackman/phantomized/releases/download/2.1.1a/dockerized-phantomjs.tar.gz" | tar xz -C / \
  && apk del .build-deps \
  && npm install -g phantomjs 
