#!/bin/bash

set -euxo pipefail

/var/www/html/occ check

if ! /var/www/html/occ app:getpath previewgenerator; then
	/var/www/html/occ app:install previewgenerator
	/var/www/html/occ app:enable previewgenerator
fi

while true
do
	/var/www/html/occ preview:pre-generate
	sleep 1h
done
