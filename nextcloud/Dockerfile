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
        echo 'pm=dynamic'; \
        echo 'pm.max_children=64'; \
        echo 'pm.start_servers=16'; \
        echo 'pm.min_spare_servers=8'; \
        echo 'pm.max_spare_servers=16'; \
    } > /usr/local/etc/php/conf.d/pm.ini

COPY *.sh /
