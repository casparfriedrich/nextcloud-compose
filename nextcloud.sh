#!/usr/bin/bash

set -euo pipefail

cd $(dirname $0)

case $1 in
	start )
		docker-compose up -d
		;;
	stop )
		docker-compose down -t 300
		;;
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
	occd )
		docker-compose exec -d -u www-data nextcloud php occ ${@:2}
		;;
esac
