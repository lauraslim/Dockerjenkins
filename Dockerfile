#!/bin/bash

FROM jenkins/jenkins:lts
MAINTAINER diana
# Make a directory to house our application code in
RUN mkdir /project

# Copy our code into our /project directory
COPY . /project

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends subversion && \
    apt-get install -y apache2 && \
    apt-get install docker
RUN jenkins-plugin-cli --plugins subversion:2.14.0
CMD [systemctl -D- FOREGROUND ]
EXPOSE 80
