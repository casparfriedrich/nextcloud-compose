FROM nextcloud:20.0-fpm-alpine

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN set -e; \
    apk update; \
    apk add --no-cache perl samba-client;

RUN set -e; \
    apk update; \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS samba-dev; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    apk del .build-deps;
