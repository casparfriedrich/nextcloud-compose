nextcloud-compose
-----------------

# High Performance Backend (HPB)

- Install and enable `client Push` app from store

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

# Notes

## Reverse proxy

```php
'overwritehost' => 'cloud.example.com',
'overwriteprotocol' => 'https',
```

## Postgres upgrade (via export/import)

```bash
# Export database
docker exec -i nextcloud-database pg_dumpall -U nextcloud > dump.sql

#import database
docker exec -i nextcloud-database psql -U nextcloud -d nextcloud < dump.sql
```
