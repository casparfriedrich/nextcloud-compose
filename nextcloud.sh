#!/usr/bin/bash

set -euo pipefail

cd $(dirname $0)

case $1 in
	up )
		docker-compose up -d
		;;
	down )
		docker-compose down -t 300
		;;
	start )
		docker-compose start
		;;
	stop )
		docker-compose stop -t 300
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
	occd )
		docker-compose exec -d -u www-data nextcloud php occ ${@:2}
		;;
esac
