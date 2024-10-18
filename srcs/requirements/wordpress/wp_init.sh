#!/bin/bash

cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then
wp core download --allow-root
	sleep 2
	wp config create --force \
						--url=$WP_URL \
						--dbname=$MYSQL_DATABASE \
						--dbuser=$MYSQL_USER1 \
						--dbpass=$MYSQL_USER1_PASSWORD \
						--dbhost=mariadb:3306 \
						--allow-root
	wp core install --url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WORDPRESS_ADMIN_NAME \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL \
					--skip-email \
					--allow-root
	wp user create $WORDPRESS_USER1 \
					$WORDPRESS_USER1_EMAIL \
					--user_pass=$WORDPRESS_USER1_PASSWORD \
					--allow-root

	# install plugin to enable communicating between wp and redis and setup values
	wp plugin install redis-cache --activate --allow-root
	wp config set WP_REDIS_HOST 'redis' --allow-root
	wp config set WP_REDIS_PORT '6379' --allow-root
	# wp config set WP_CACHE 'yes' --allow-root # -> to enable WP use CACHE, But no need because somehow it's overriden
	wp config set WP_REDIS_DATABASE '0' --allow-root
	wp plugin activate redis-cache --allow-root
	wp redis enable --allow-root
	
	while [ ! -f /var/www/html/wp-content/plugins/wps-hide-login/wps-hide-login.php ]; do
		sleep 5
		echo "Waiting for wps-hide-login getting done"
	done
	sleep 1
	wp plugin activate wps-hide-login --allow-root

	chown -R www-data:www-data /var/www/html/*
fi
echo "Wordpress Done"
exec php-fpm7.4 -F

# To make sure wordpress use redis, use this command afterwards when things are done
	# wp redis status --allow-root
