# Tor + caddy
Easily host clearnet/darknet sites using caddy in docker

## Usage
- Clone this repository
```bash
git clone https://github.com/wait-what/torcaddy
```
- Use [mkp224o](https://github.com/cathugger/mkp224o) to generate onion address keys
    - Download from [releases](https://github.com/cathugger/mkp224o/releases)
    - Or build from source
    ```bash
    git clone https://github.com/cathugger/mkp224o
    cd mkp224o

    ./autogen.sh
    ./configure
    make
    ```
> Note: don't try a prefix longer than 5-6 characters, it will take forever
```
./mkp224o -B -d ../generated -n 1 [prefix]
```
- Place your generated `hs_ed25519_secret_key` files in `tor/keys`
> Don't use subdirectories
```bash
mkdir tor/keys

for i in generated/*; do
    mv $i/hs_ed25519_secret_key tor/keys/$(cat $i/hostname)
done
```
- Edit `docker-compose.yaml`
    - You might want to remove the `example` service
    - If you are not interested in the clearnet part, remove the `ports` section from `caddy`
- Edit `caddy/Caddyfile` (examples inside)
- Run `docker compose up -d` to start the stack
> Note: if you edit `Dockerfile` or `entrypoint.sh` you need to rebuild the image with `docker compose build`
- Run `docker compose logs -f` to see logs

## License
[Unlicense](https://choosealicense.com/licenses/unlicense/)
