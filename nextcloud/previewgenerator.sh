#!/bin/bash

set -euxo pipefail

./occ check

if ! ./occ app:getpath previewgenerator; then
	./occ app:install previewgenerator
	./occ app:enable previewgenerator
fi

while true
do
	./occ preview:pre-generate
	sleep 1h
done
