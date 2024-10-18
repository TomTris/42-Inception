#!/bin/bash

# Wait for SSL certificates to be generated
while [ ! -f /var/www/html/wp-content/plugins/redis-cache/LICENSE.md ]; do
    sleep 5
    echo "Waiting for SSL certificates..."
done
sleep 1

mv /wps-hide-login /var/www/html/wp-content/plugins/wps-hide-login
echo "Done"