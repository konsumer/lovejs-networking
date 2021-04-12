# This is simply luajit + luarocks + luasocket

FROM akorn/luarocks:luajit2.1-alpine as luasocket

RUN  apk add --no-cache build-base zip && luarocks install luasocket && apk del build-base zip