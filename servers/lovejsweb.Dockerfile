# This will build your love app (in /app/src) into /app/pub and start a static webserver

FROM node:alpine as lovejsweb

RUN apk add --no-cache git zip
RUN git clone --depth=1 https://github.com/Davidobot/love.js.git /app/love.js && cd /app/love.js && npm i && npm i -g light-server
RUN apk del git

COPY modified /app/web-stuff

WORKDIR /app/pub
VOLUME /app/src

CMD cd /app/src && rm -f /app/game.love && zip -r /app/game.love . && node /app/love.js/index.js --title "Network Demo" --memory 16777216 /app/game.love /app/pub && cp /app/web-stuff/* /app/pub/ && light-server -p 8000 -s /app/pub