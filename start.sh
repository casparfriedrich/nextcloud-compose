#!/bin/bash

set -euxo pipefail

docker compose build --pull
docker compose pull
docker compose up --wait
docker compose logs --follow
