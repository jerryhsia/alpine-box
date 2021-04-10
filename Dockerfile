FROM alpine:3.13.4
# FROM centos:8

COPY centos-install.sh alpine-install.sh /
RUN cd / && ./alpine-install.sh 2>&1