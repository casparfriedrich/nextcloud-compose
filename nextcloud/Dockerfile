FROM nextcloud:20.0-apache

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    imagemagick \
    procps \
    smbclient \
    supervisor
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisord /var/run/supervisord
COPY supervisord.conf /

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -i 's/post_max_size = 8M/post_max_size = 80M/g' /usr/local/etc/php/php.ini
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /usr/local/etc/php/php.ini

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
