FROM fastsol/lap7:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TAG 3.27v

RUN apt-get update && \
    apt-get -y install php-bcmath && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /etc/apache2/sites-enabled/* && \
    curl -Ls https://github.com/LiveHelperChat/livehelperchat/archive/${TAG}.tar.gz \
    |  tar xzf - -C /tmp && rm -rf /app && mv -T /tmp/livehelperchat-${TAG}/lhc_web /var/www
ADD lhc.conf /etc/apache2/sites-enabled
