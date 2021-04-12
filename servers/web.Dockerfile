# This will build your love app (in /app/src) into /app/pub and start a static webserver

FROM python:alpine as lovejswebudp

RUN apk add --no-cache build-base zip zlib-dev libjpeg-turbo-dev
RUN pip3 install makelove
RUN apk del build-base zip

COPY makelove.toml /app/

WORKDIR /app/pub
VOLUME /app/src

CMD cd /app/src && makelove lovejs --config /app/makelove.toml && cd /app/build/lovejs && unzip netdemo-lovejs.zip && mv netdemo/* /app/pub && rm -rf /app/src/template_files && echo "Static webserver running on http://localhost:8000" && cd /app/pub && python3 -m http.server 8000