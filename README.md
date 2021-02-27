nextcloud-compose
-----------------

# Notes

## Reverse proxy

If a reverse proxy is used for ssl offloading, the following lines need to be
added to `config.php` to ensure that nextcloud creates correct URLs.

```php
'trusted_domains' => array (
  0 => 'cloud.example.com',
),
'overwrite.cli.url' => 'https://cloud.example.com',
'overwriteprotocol' => 'https',
```
