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
		docker-compose exec -d -u www-data webserver php cron.php
		;;
	occ )
		docker-compose exec -d -u www-data webserver php occ ${@:2}
		;;
esac
