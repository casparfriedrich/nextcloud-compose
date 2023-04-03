FROM h2non/imaginary:1.2

user root

RUN apt-get -y update && \
    apt-get -y install \
        curl \
        ;

user nobody

CMD ["-enable-url-source"]
