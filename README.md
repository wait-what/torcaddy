# Tor + caddy
Easily host clearnet/darknet sites using caddy in docker

## Usage
- Clone this repository
- Use [mkp224o](https://github.com/cathugger/mkp224o) to generate keys
```
./autogen.sh
./configure
make
./mkp224o -B -d generated -n 1 [prefix]
```
- Place your `hs_ed25519_secret_key` files in `tor/keys`
```
mkdir tor/keys
mv generated/*/hs_ed25519_secret_key tor/keys
```
- Edit `caddy/Caddyfile` (examples included)
- Edit `docker-compose.yaml`
- Run `docker compose up -d`
- Run `docker compose logs -f` to see logs
