FROM redis:6.2

RUN set -e; \
    \
    apt-get update; \
    apt-get install --assume-yes --no-install-recommends \
        vim \
    ; \
    rm -rf /var/lib/apt/lists/*

CMD ["sh", "-c", "exec redis-server --requirepass \"$REDIS_HOST_PASSWORD\""]
