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
	occ )
		docker-compose exec -u www-data nextcloud php occ ${@:2}
		;;
	occd )
		docker-compose exec -d -u www-data nextcloud php occ ${@:2}
		;;
esac
