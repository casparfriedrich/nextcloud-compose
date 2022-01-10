nextcloud-compose
-----------------

# Notes

## ZFS

```bash
zfs create \
    -o mountpoint=/var/lib/docker \
    tank/docker

zfs create \
    -o mountpoint=/var/lib/nextcloud \
    tank/nextcloud

# https://vadosware.io/post/everything-ive-seen-on-optimizing-postgres-on-zfs-on-linux/
zfs create \
    -o mountpoint=/var/lib/nextcloud/db \
    -o compression=zstd \
    -o logbias=throughput \
    -o recordsize=16k \
    tank/nextcloud/db
```

## Configure high performance backend (HPB)

- Add proxy to list of trusted proxies in `config.php`:

```bash
'trusted_proxies' =>
  array (
    0 => '172.0.0.0/8',
  ),
```

- Run setup:

```bash
php occ notify_push:setup https://cloud.example.com/push
```

## Reverse proxy

```php
'overwritehost' => 'cloud.example.com',
'overwriteprotocol' => 'https',
```

## Postgres upgrade via export and (re-)import

```bash
# Export
docker exec -i -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" nextcloud-database pg_dumpall > dump.sql

# Import
docker exec -i -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" nextcloud-database psql < dump.sql
```
