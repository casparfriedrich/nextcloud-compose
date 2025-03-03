FROM nextcloud:30.0

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
        echo 'pm = static'; \
        echo 'pm.max_children = 1024'; \
    } >> /usr/local/etc/php/conf.d/pm.ini;

COPY *.sh /
