#!/bin/bash

i=0
while [ ! -f /var/www/html/wp-content/plugins/redis-cache/LICENSE.md ]; do
    i=$((i+1))
    if [ $i -eq 30 ]; then
        echo "Waiting too long, exiting..." >&2
        exit 1
    fi
    sleep 5
    echo "Waiting for Wordpress to be ready..."
done

sleep 1

if [ ! -f /var/www/html/wp-content/plugins/wps-hide-login/copied ]; then
    echo "Moving /wps-hide-login..."
    mv /wps-hide-login /var/www/html/wp-content/plugins/wps-hide-login
    touch /var/www/html/wp-content/plugins/wps-hide-login/copied
else
    echo "/wps-hide-login is already here"
fi
echo "Done"