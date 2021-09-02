FROM nextcloud:22.1-apache

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV NEXTCLOUD_UPDATE=1

RUN set -e; \
    \
    apt-get update; \
    apt-get install --assume-yes --no-install-recommends \
        imagemagick \
        procps \
        smbclient \
        supervisor \
        vim \
    ; \
    rm -rf /var/lib/apt/lists/*

RUN set -e; \
    \
    cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini; \
    sed -i 's/^post_max_size.*$/post_max_size = 80M/g' /usr/local/etc/php/php.ini; \
    sed -i 's/^upload_max_filesize.*$/upload_max_filesize = 20M/g' /usr/local/etc/php/php.ini; \
    sed -i 's/^output_buffering.*$/output_buffering = off/g' /usr/local/etc/php/php.ini

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN echo '0 * * * * php -f /var/www/html/occ preview:pre-generate' >> /var/spool/cron/crontabs/www-data

COPY supervisord.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]
