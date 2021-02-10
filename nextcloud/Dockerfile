FROM nextcloud:20.0-apache

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get install -y imagemagick

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN sed -i 's/^post_max_size = .*/post_max_size = 800M/g' /usr/local/etc/php/php.ini
RUN sed -i 's/^upload_max_filesize = .*/upload_max_filesize = 200M/g' /usr/local/etc/php/php.ini
