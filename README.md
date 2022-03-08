# nextcloud-compose

## Notes

### ZFS

```bash
zfs create \
    -o mountpoint=/var/lib/nextcloud/app \
    -o compression=zstd \
    tank/nextcloud-app

zfs create \
    -o mountpoint=/var/lib/nextcloud/config \
    -o compression=zstd \
    tank/nextcloud-config

zfs create \
    -o mountpoint=/var/lib/nextcloud/cache \
    -o compression=zstd \
    tank/nextcloud-cache

zfs create \
    -o mountpoint=/var/lib/nextcloud/data \
    -o compression=zstd \
    tank/nextcloud-data

zfs create \
    -o mountpoint=/var/lib/nextcloud/db \
    -o compression=zstd \
    -o logbias=throughput \
    -o recordsize=16k \
    tank/nextcloud-db
```

### Configure high performance backend (HPB)

- Add the docker network to the list of trusted proxies in `config.php`:

```bash
'trusted_proxies' =>
  array (
    0 => '172.16.0.0/12',
  ),
```

- Run setup:

```bash
php occ notify_push:setup https://cloud.example.com/push
```

### Reverse proxy

```php
'overwritehost' => 'cloud.example.com',
'overwriteprotocol' => 'https',
```

### Postgres upgrade via export and (re-)import

```bash
# Export
docker exec -i -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" nextcloud-db pg_dumpall > dump.sql
docker compose exec -T -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" db pg_dumpall > dump.sql

# Import
docker exec -i -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" nextcloud-db psql < dump.sql
docker compose exec -T -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" db psql < dump.sql
```

### Postgres checksums

```bash
# Enable checksums
docker compose run --rm -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" db pg_checksums -e

# Check integrity
docker compose run --rm -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" db pg_checksums -c
```
