FROM nextcloud:21.0-apache

RUN apt-get update && apt-get install -y \
    imagemagick \
    locales \
    procps \
    smbclient \
    supervisor \
    vim
RUN rm -rf /var/lib/apt/lists/*

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG=en_US.utf8

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -i 's/post_max_size = 8M/post_max_size = 80M/g' /usr/local/etc/php/php.ini
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /usr/local/etc/php/php.ini

RUN echo '0 * * * * php -f /var/www/html/occ preview:pre-generate' >> /var/spool/cron/crontabs/www-data

ENV NEXTCLOUD_UPDATE=1

COPY supervisord.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]
