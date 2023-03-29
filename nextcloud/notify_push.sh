#!/bin/bash

set -euxo pipefail

./occ check

if ! ./occ app:getpath notify_push; then
	./occ app:install notify_push
	./occ app:enable notify_push
fi

exec `./occ app:getpath notify_push`/bin/`uname -m`/notify_push ./config/config.php
