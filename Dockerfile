FROM alpine:3.13.4
# FROM centos:8

WORKDIR /root

COPY centos-install.sh alpine-install.sh /root/
RUN ./alpine-install.sh 2>&1
