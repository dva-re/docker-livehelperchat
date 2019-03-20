FROM tutum/apache-php:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TAG 3.20v

RUN apt-get update && \
    apt-get -y install php5-curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -Ls https://github.com/LiveHelperChat/livehelperchat/archive/${TAG}.tar.gz \
    |  tar xzf - -C /tmp && rm -rf /app && mv -T /tmp/livehelperchat-${TAG}/lhc_web /app

VOLUME /app/var/storage
