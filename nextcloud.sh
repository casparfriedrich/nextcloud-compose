#!/bin/bash

set -euxo pipefail

case $1 in
	up )
		docker-compose up
		;;
	down )
		docker-compose down
		;;
	cron )
		docker-compose exec -d -u www-data nextcloud php cron.php
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
esac
