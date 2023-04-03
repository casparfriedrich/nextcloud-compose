#!/bin/bash

set -euxo pipefail

APP_LIST=$(/var/www/html/occ app:list --output=json)

if jq -e '.disabled | has("notify_push")' <<< $APP_LIST; then
	exit 1
fi

if ! jq -e '.enabled | has("notify_push")' <<< $APP_LIST; then
	/var/www/html/occ app:install notify_push
fi

exec `/var/www/html/occ app:getpath notify_push`/bin/`uname -m`/notify_push /var/www/html/config/config.php
