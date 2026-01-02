#!/usr/bin/env bash

set -euxo pipefail

START_DATE=$(date --iso-8601=seconds)

docker compose exec -T -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" postgres pg_dump nextcloud | pv > nextcloud-${START_DATE}.sql
