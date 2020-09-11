#!/usr/bin/env bash

set -euo pipefail

cd $(dirname $0)

case $1 in
	start )
		docker-compose up --build --abort-on-container-exit --force-recreate
		;;
	stop )
		docker-compose down --volumes --timeout 300
		;;
	cron )
		docker-compose exec -u www-data -d nextcloud php cron.php
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
esac
