FROM postgres:14.1

RUN set -e; \
    \
    apt-get update; \
    apt-get install --assume-yes --no-install-recommends \
        vim \
        zplug \
        zsh \
    ; \
    rm -rf /var/lib/apt/lists/*

ADD https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc /etc/zsh/zshrc
