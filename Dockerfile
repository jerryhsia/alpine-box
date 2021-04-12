FROM alpine:3.13.4

WORKDIR /root

COPY alpine-install.sh /root/
RUN ./alpine-install.sh 2>&1
