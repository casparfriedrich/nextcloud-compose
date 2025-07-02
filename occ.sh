#!/bin/bash

set -euxo pipefail

docker compose exec --user www-data app php occ "$@"
