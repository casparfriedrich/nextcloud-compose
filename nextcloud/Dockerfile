FROM nextcloud:22.2-apache

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV NEXTCLOUD_UPDATE=1

RUN set -e; \
    \
    apt-get update; \
    apt-get install --assume-yes --no-install-recommends \
        imagemagick-6.q16 \
        libmagickcore-6.q16-6-extra \
        procps \
        smbclient \
        supervisor \
        vim \
        zplug \
        zsh \
    ; \
    rm -rf /var/lib/apt/lists/*

ADD https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc /etc/zsh/zshrc

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN echo '0 * * * * php -f /var/www/html/occ preview:pre-generate' >> /var/spool/cron/crontabs/www-data
