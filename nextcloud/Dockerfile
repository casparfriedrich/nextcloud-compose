FROM nextcloud:29.0

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

RUN { \
        echo 'opcache.enable_cli=1'; \
        echo 'opcache.jit=function'; \
        echo 'opcache.jit_buffer_size=256M'; \
    } >> /usr/local/etc/php/conf.d/opcache-recommended.ini;

RUN { \
        echo 'pm = dynamic'; \
        echo 'pm.max_children = 64'; \
        echo 'pm.start_servers = 16'; \
        echo 'pm.max_spare_servers = 16'; \
        echo 'pm.min_spare_servers = 8'; \
    } >> /usr/local/etc/php/conf.d/pm.ini;

COPY *.sh /
