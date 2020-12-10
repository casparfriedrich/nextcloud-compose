#!/usr/bin/env bash

set -euxo pipefail

openssl req \
    -x509 \
    -nodes \
    -newkey rsa:4096 \
    -keyout fullchain.pem.key \
    -out fullchain.pem \
    -days 365 \
    -subj '/CN=localhost'
