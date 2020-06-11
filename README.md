# nextcloud-compose

Personal Nextcloud with docker-compose

## installation

- Change the NEXTCLOUD_ADMIN_PASSWORD variable in `nextcloud.env`
- Change the POSTGRES_PASSWORD variable in `database.env`
- Start services: `docker-compose up [-d]`

## Switch to alpine images or vice versa

(from https://github.com/nextcloud/docker/issues/601)

`docker exec nextcloud-compose_nextcloud_1 chown -R www-data:root /var/www`
