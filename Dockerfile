# Start from the latest golang base image
FROM golang:1.14

# Add Maintainer Info
LABEL maintainer="FFMD-for Docker File"

# Build Args
ARG LOG_DIR=/var/log
ARG LIB_DIR=/var/lib/yanic
ARG MESHV_DIR=/var/www/html/meshviewer/data

# Create Dirs
RUN mkdir -p ${LIB_DIR} && \
mkdir -p ${MESHV_DIR}

# Work Dirs
# WORKDIR /yanic

# Enviroment Variables
ENV LOG_FILE_LOCATION=${LOG_DIR}/yanic.log
ENV MESHVIEWER_DIR=${MESHV_DIR}

# ADD CONFIG FILE
ADD config.toml /etc/yanic.conf

RUN apt-get update && \
apt-get install -y git && \
go get -v -u github.com/FreifunkBremen/yanic &&\
apt-get -y dist-upgrade && \Update
apt-get autoremove &&\
apt-get clean

EXPOSE 8080
CMD /go/bin/yanic serve -c /etc/yanic.conf
