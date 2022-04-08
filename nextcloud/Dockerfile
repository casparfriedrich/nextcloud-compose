FROM nextcloud:23.0-apache

ARG DEBIAN_FRONTEND=noninteractive

ENV APACHE_DISABLE_REWRITE_IP=1
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV NEXTCLOUD_UPDATE=1

RUN set -e; \
    \
    apt-get update; \
    apt-get install --assume-yes --no-install-recommends \
        imagemagick \
        jq \
        procps \
        smbclient \
        supervisor \
        neovim \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN sed -i 's/^opcache\.interned_strings_buffer.*$/opcache\.interned_strings_buffer=16/g' /usr/local/etc/php/conf.d/opcache-recommended.ini;

RUN { \
        echo 'opcache.enable_cli=1'; \
        echo 'opcache.jit=function'; \
        echo 'opcache.jit_buffer_size=256M'; \
    } >> /usr/local/etc/php/conf.d/opcache-recommended.ini;

RUN { \
        echo 'pm=static'; \
        echo 'pm.max_children=128'; \
    } > /usr/local/etc/php/conf.d/pm.ini

COPY *.sh /
