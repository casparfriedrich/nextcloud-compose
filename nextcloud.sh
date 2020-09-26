#!/usr/bin/env bash

set -euo pipefail

cd $(dirname $0)

case $1 in
	start )
		docker-compose up --build --force-recreate --remove-orphans --detach
		;;
	stop )
		docker-compose down --volumes --timeout 300
		;;
	cron )
		docker-compose exec -d -u www-data nextcloud php cron.php
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
esac
