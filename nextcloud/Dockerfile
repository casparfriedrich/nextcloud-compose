FROM nextcloud:23.0-apache

ENV APACHE_DISABLE_REWRITE_IP=1
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV NEXTCLOUD_UPDATE=1

RUN set -e; \
    \
    apt-get update; \
    apt-get install --assume-yes --no-install-recommends \
        imagemagick-6.q16 \
        jq \
        libmagickcore-6.q16-6-extra \
        procps \
        smbclient \
        supervisor \
        vim \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

COPY pm.ini /usr/local/etc/php/conf.d/
COPY hpb.sh /
