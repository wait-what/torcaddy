#!/bin/sh

# Clean old configuration
echo > /etc/tor/torrc

# Generate new configuration
cd /var/lib/tor_keys
for service in *; do
    echo "Adding $service"

    if [ ! -d "../tor/$service" ]; then
        mkdir ../tor/$service
    fi

    cp $service ../tor/$service/hs_ed25519_secret_key

    # Set required permissions
    chown -R tor ../tor/$service
    chmod -R 700 ../tor/$service

    # Add service to torrc
    echo HiddenServiceDir /var/lib/tor/$service >> /etc/tor/torrc
    echo HiddenServicePort 80 caddy:80 >> /etc/tor/torrc
done

# Start tor
exec su tor -s /bin/sh -c tor
