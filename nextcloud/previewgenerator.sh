#!/bin/bash

set -euxo pipefail

APP_LIST=$(/var/www/html/occ app:list --output=json)

if jq -e '.disabled | has("previewgenerator")' <<< $APP_LIST; then
	exit 1
fi

if ! jq -e '.enabled | has("previewgenerator")' <<< $APP_LIST; then
	/var/www/html/occ app:install previewgenerator
fi

while true
do
	/var/www/html/occ preview:pre-generate
	sleep 1h
done
