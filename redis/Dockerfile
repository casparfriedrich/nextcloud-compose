FROM redis:6.2

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

CMD ["sh", "-c", "exec redis-server --requirepass \"$REDIS_HOST_PASSWORD\""]
