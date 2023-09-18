FROM postgres:15.4-alpine

RUN apk add --no-cache --update \
    musl \
    musl-locales \
    musl-utils \
    tzdata \
    ;

COPY --chown=postgres:postgres --chmod=600 postgresql.conf /var/lib/postgresql

CMD ["postgres", "-c", "config_file=/var/lib/postgresql/postgresql.conf"]
