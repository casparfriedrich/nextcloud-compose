FROM nextcloud:20.0-apache

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get install -y imagemagick

# RUN ln -rs /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN ln -rs /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
