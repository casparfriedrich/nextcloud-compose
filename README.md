nextcloud-compose
-----------------

# Notes

## Reverse proxy

```php
'overwrite.cli.url' => 'https://cloud.example.com',
```

## Postgres upgrade (via export/import)

```bash
# Export database
docker exec -i <CONTAINER ID> pg_dumpall -U nextcloud > dump.sql

#import database
docker exec -i <CONTAINER ID> psql -U nextcloud -d nextcloud < dump.sql
```
