#!/usr/bin/env bash

set -euo pipefail

case $1 in
	start )
		docker-compose up --build --remove-orphans --abort-on-container-exit
		;;
	stop )
		docker-compose down --volumes
		;;
	cron )
		docker-compose exec -d -u www-data nextcloud php cron.php
		;;
esac
