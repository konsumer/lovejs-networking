# This will proxy websockets to posix sockets
# https://emscripten.org/docs/porting/networking.html#full-posix-sockets-over-websocket-proxy-server

FROM alpine as websocket_to_posix_proxy

COPY websocket_to_posix_proxy/ src

RUN apk add --no-cache build-base cmake libstdc++ libgcc
RUN cd src && cmake . && make && cp websocket_to_posix_proxy /usr/bin/ && cd .. && rm -rf src
RUN apk del build-base cmake

CMD websocket_to_posix_proxy 12346
