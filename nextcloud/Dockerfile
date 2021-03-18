FROM nextcloud:21.0-apache

RUN apt-get update && apt-get install -y \
    imagemagick \
    procps \
    smbclient \
    supervisor \
    vim
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisord /var/run/supervisord
COPY supervisord.conf /

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -i 's/post_max_size = 8M/post_max_size = 80M/g' /usr/local/etc/php/php.ini
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /usr/local/etc/php/php.ini

RUN echo '0 * * * * php -f /var/www/html/occ preview:pre-generate' >> /var/spool/cron/crontabs/www-data

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
