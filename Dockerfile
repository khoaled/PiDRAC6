FROM didierc/baseimage-gui

ENV APP_NAME="PiDRAC 6" \
    IDRAC_PORT=443 \
    IDRAC_VPORT=5900

COPY keycode-hack.c /keycode-hack.c

RUN apk update && \
    apk add --no-cache openjdk7 gcc musl-dev libx11-dev wget openssl && \    
    gcc -o /keycode-hack.so /keycode-hack.c -shared -s -ldl -fpic && \
    rm /keycode-hack.c

RUN mkdir /app && \
    chown 1000:1000 /app

COPY startapp.sh /startapp.sh

WORKDIR /app

