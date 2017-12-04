FROM debian:stable-slim
MAINTAINER BitBuyIO <bitbuyio@outlook.com>
LABEL description="running minergate console using docker container by http://bit.ly/docker-minergate"

RUN apt-get update && \
    apt-get -qqy --no-install-recommends  install \
    ca-certificates \
    wget && \
    rm -rf /var/lib/apt/lists/*
    
RUN wget https://minergate.com/download/deb-cli && \
    # wget -q --content-disposition https://minergate.com/download/deb-cli && \
    dpkg -i *.deb && \
    rm *.deb

ENV USER bitbuyio@outlook.com
ENV COIN -xmr

ENTRYPOINT minergate-cli -user $USER $COIN
