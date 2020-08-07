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
		docker-compose exec -u www-data -d nextcloud php cron.php
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
esac
