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

- Shutdown services

```bash
docker-compose down # Or use systemd service
```

- Navigate to the nextcloud volume (as root)

```bash
cd /var/lib/docker/volumes/nextcloud-compose_nextcloud/_data/

```

- Add the following config lines to `/var/lib/docker/volumes/nextcloud-compose_nextcloud_config/_data/config.php`:

```php
  'overwritehost' => '<HOST>[:PORT]',
  'overwriteprotocol' => 'https',
```

IMPORTANT: `<HOST>` and `<PORT>` must be the external hostname (or ip) and port for example `nextcloud.domain.tld:443` ([more](https://docs.nextcloud.com/server/17/admin_manual/configuration_server/reverse_proxy_configuration.html)).

- Start services again

```bash
docker-compose up -d # Or use systemd service
```

- Connect via webrowser and finish installation

## Execute Nextcloud commands (occ)

```bash
docker-compose exec -u www-data webserver php '<COMMAND>'
```

## Create selfsigned certificate

```bash
openssl req -x509 -nodes -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -subj '/CN=localhost'
```
