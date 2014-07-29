FROM ubuntu:14.04

MAINTAINER "John Goodall <jgoodall@ornl.gov>"

ENV DEBIAN_FRONTEND noninteractive

# Install basics
RUN apt-get -q update
RUN apt-get -qy install supervisor wget curl git

# Better logging of services in supervisor
RUN apt-get -qy install python-pip && pip install --quiet supervisor-stdout

# Install confd
RUN curl -qL https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-linux-amd64 -o /confd && chmod +x /confd
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates
