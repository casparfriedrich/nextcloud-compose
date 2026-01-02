#!/bin/bash

set -euxo pipefail

docker compose build --pull
docker compose pull
docker compose up
