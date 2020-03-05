FROM golang:1.13

ADD config.toml /etc/yanic.conf

RUN  apt-get update && \
apt-get install -y git && \
go get -v -u github.com/FreifunkBremen/yanic && \
mkdir -p /var/lib/yanic && \
mkdir -p /var/www/html/meshviewer/data && \
touch /var/log/yanic.log && \
apt-get -y dist-upgrade && \
apt-get autoremove && \
apt-get clean

EXPOSE 8080
CMD /go/bin/yanic serve -c /etc/yanic.conf
