# nextcloud-compose

## Notes

### Configure high performance backend (HPB)

```bash
php occ notify_push:setup https://cloud.example.com/push
```

### Reverse proxy

```php
'overwritehost' => 'cloud.example.com',
'overwriteprotocol' => 'https',
```

### Postgres upgrade via export and (re-)import

#### Dump database

```bash
# Dump database
docker compose exec -T -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" postgres pg_dump nextcloud > dump.sql

# Restore database
docker compose exec -T -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" postgres psql < dump.sql
```

### Postgres checksums

```bash
# Enable checksums
docker compose run --rm -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" postgres pg_checksums -e

# Check integrity
docker compose run --rm -e PGUSER="nextcloud" -e PGPASSWORD="nextcloud" postgres pg_checksums -c
```

### Imaginary

```bash
./occ config:system:set preview_imaginary_url --value="http://imaginary:9000"
./occ config:system:set enabledPreviewProviders 0 --value="OC\\Preview\\Imaginary"
```
