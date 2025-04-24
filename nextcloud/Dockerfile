FROM nextcloud:31.0

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN apt-get -y update && \
    apt-get -y install \
        imagemagick \
        inotify-tools \
        jq \
        libbz2-dev \
        libsmbclient-dev \
        neovim \
        smbclient \
        ;

RUN pecl install \
        inotify \
        smbclient \
        ;

RUN docker-php-ext-enable \
        inotify \
        smbclient \
        ;

RUN ln -sf /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN { \
        echo 'pm = static'; \
        echo 'pm.max_children = 128'; \
    } >> /usr/local/etc/php/conf.d/pm.ini;
