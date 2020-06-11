#!/usr/bin/env bash

set -euxo pipefail

case $1 in
	start )
		docker-compose up --build --abort-on-container-exit
		;;
	stop )
		docker-compose down
		;;
	cron )
		docker-compose exec -d -u www-data nextcloud php cron.php
		;;
esac
