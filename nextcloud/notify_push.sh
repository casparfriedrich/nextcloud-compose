#!/bin/bash

set -euxo pipefail

/var/www/html/occ check

if ! /var/www/html/occ app:getpath notify_push; then
	/var/www/html/occ app:install notify_push
	/var/www/html/occ app:enable notify_push
fi

exec `/var/www/html/occ app:getpath notify_push`/bin/`uname -m`/notify_push ./config/config.php
