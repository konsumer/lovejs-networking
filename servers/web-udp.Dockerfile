# This is node build of love app + static webserver

FROM python:alpine as lovejswebudp

COPY udp /app/src
COPY makelove.toml /app/

RUN apk add --no-cache build-base zip zlib-dev libjpeg-turbo-dev
RUN pip3 install makelove && cd /app/src && makelove lovejs --config ../makelove.toml && cd ../build/lovejs && unzip netdemo-lovejs.zip && mv netdemo /app/pub && rm -rf /app/src/template_files
RUN apk del build-base zip zlib-dev libjpeg-turbo-dev

WORKDIR /app/pub

CMD echo "Static webserver running on http://localhost:8000" && python3 -m http.server 8000