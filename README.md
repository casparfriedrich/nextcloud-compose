# nextcloud-compose

Personal Nextcloud with docker-compose

## Installation

- Change the POSTGRES_PASSWORD variable in `database.env`

- Create a file, called `combined.pem`, with the key and certificate concatenated

```bash
cat <CERTIFICATE> <KEY> > combined.pem
```

HINT: This will hopefully become obsolete in the future ([more](https://github.com/haproxy/haproxy/issues/221)).

- Start services

```bash
docker-compose up -d # Or use systemd service
```

- Make sure you can connect via webbrowser (DO NOT FINISH INSTALLATION YET!)

```

- Add the following config lines to `/var/lib/docker/volumes/nextcloud-compose_nextcloud_config/_data/config.php`:

```php
  'overwritehost' => '<HOST>:<PORT>',
  'overwriteprotocol' => 'https',
```

IMPORTANT: `<HOST>` and `<PORT>` must be the external hostname (or ip) and port for example `nextcloud.domain.tld:443` ([more](https://docs.nextcloud.com/server/17/admin_manual/configuration_server/reverse_proxy_configuration.html)).

- Connect via webrowser and finish installation
