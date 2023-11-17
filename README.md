# Tor + caddy
Easily host clearnet/darknet sites using caddy in docker

## Usage
- Use [mkp224o](https://github.com/cathugger/mkp224o) to generate keys
- Place your `hs_ed25519_secret_key` files in `tor/keys`
- Edit `caddy/Caddyfile` (examples included)
- Run `docker compose up -d`
- Run `docker compose logs -f` to see logs
