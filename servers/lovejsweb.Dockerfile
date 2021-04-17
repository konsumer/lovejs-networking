# This will build your love app (in /app/src) into /app/pub and start a static webserver

FROM node:alpine as lovejsweb

RUN apk add --no-cache zip
RUN npm i -g light-server love.js

WORKDIR /app/pub
VOLUME /app/src

CMD cd /app/src && rm -f /app/game.love && zip /app/game.love *.lua && love.js --title "Network Demo" --memory 16777216 /app/game.love /app/pub && cp /app/src/index.html /app/pub && light-server -p 8000 -s /app/pub