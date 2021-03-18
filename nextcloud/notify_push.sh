#!/bin/bash

set -euxo pipefail

APP_LOCATION=/var/www/html/custom_apps/notify_push/bin/$(uname -m)
CONFIG_LOCATION=/var/www/html/config

# Todo: Wait until available: curl http://localhost/index.php/apps/notify_push/test/version
sleep 3

exec $APP_LOCATION/notify_push --nextcloud-url "http://localhost" $CONFIG_LOCATION/config.php
