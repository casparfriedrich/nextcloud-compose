nextcloud-compose
-----------------

# Installation

1. Start main application: `./start app` _It's imporatant to not start the high performance backend, yet!_
2. Wait until you can connect and log in via web browser
3. Install and enable `notify_push` app: `./occ app:install notify_push`
4. _todo_ Configure reverse proxy
5. Start High Performance Backend (HPB): `./start hpb`

# Configure high performance backend (HPB)

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
# Export
docker exec -i -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" nextcloud-database pg_dumpall > dump.sql

# Import
docker exec -i -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" nextcloud-database psql < dump.sql
```
