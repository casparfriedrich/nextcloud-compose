nextcloud-compose
-----------------

# Installation

1. Start main application

```bash
docker-compose up --detach app # It's imporatant to not start the high performance backend, yet!
```

2. Wait until you can connect and log in via web browser

3. Install and enable `notify_push` app

```bash
./occ app:install notify_push
```

4. _todo_ Configure reverse proxy

5. Start High Performance Backend (HPB)

```bash
docker-compose up --detach hpb
```

# High Performance Backend (HPB)

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
