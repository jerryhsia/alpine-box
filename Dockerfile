FROM centos:centos8

COPY install.sh /
RUN cd / && ./install.sh 2>&1