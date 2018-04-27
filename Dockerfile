FROM ubuntu:17.10
MAINTAINER BitBuyIO <bitbuyio@outlook.com>
LABEL description="running minergate console using docker container by http://bit.ly/docker-minergate"

RUN apt-get update && \
    apt-get -qqy --no-install-recommends  install \
    ca-certificates \
    libxcb1 \
    libpcre16-3 \
    wget && \
    rm -rf /var/lib/apt/lists/*
    
RUN wget -q --content-disposition https://minergate.com/download/deb-cli && \       
    dpkg -i *.deb && \
    rm *.deb

ENV USERNAME minergate@mmink.eu
ENV COIN --xmr 1

ENTRYPOINT nice -10 minergate-cli --user $USERNAME $COIN
