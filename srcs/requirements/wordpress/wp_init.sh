#!/bin/bash

cd /var/www/html
echo "1"
wp core download --allow-root
echo "2"
sleep 5
echo "2.5"
wp config create --force \
					--url=$WP_URL \
					--dbname=$WORDPRESS_DB_NAME \
					--dbuser=$WORDPRESS_USER1 \
					--dbpass=$WORDPRESS_USER1_PASSWORD \
					--dbhost=mariadb:3306 \
					--allow-root
echo "3"
wp core install --url=$WP_URL \
				--title=$WP_TITLE \
				--admin_user=$WORDPRESS_ADMIN_NAME \
				--admin_password=$WORDPRESS_ADMIN_PASSWORD \
				--admin_email=$WORDPRESS_ADMIN_EMAIL \
				--skip-email \
				--allow-root
echo "4"
wp user create ${WORDPRESS_DB_USER1} \
				${WORDPRESS_USER1_EMAIL} \
				--user_pass=${WORDPRESS_USER1_PASSWORD} \
				--allow-root
echo "5"
wp option update home $WP_URL --allow-root
echo "6"
wp option update siteurl  $WP_URL --allow-root
echo "7"

chown -R www-data:www-data /var/www/html/*
exec php-fpm7.4 -F
