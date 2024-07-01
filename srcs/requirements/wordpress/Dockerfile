FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y php php7.4-fpm php-gd wget php-mysqli 

RUN mkdir -p /var/www/html /run/php

RUN chown -R www-data:www-data /var/www/html
RUN chown -R www-data:www-data /run/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./wp_init.sh /setup_wp.sh
RUN  chmod +x /setup_wp.sh

# ENV MYSQL_ROOT_PASSWORD=root_password
# ENV MYSQL_DATABASE=wp_database
# ENV WORDPRESS_USER1=wp_user1
# ENV WORDPRESS_USER1_PASSWORD=wp_user1_password
# ENV WORDPRESS_DB_HOST=localhost
# ENV WORDPRESS_DB_NAME=wp_database
# ENV WP_URL=https://localhost
# ENV WP_TITLE=qdo_WP
# ENV WORDPRESS_ADMIN_NAME=qdo_boss
# ENV WORDPRESS_ADMIN_PASSWORD=qdo_boss_pass
# ENV WORDPRESS_ADMIN_EMAIL=hehehe@gmail.com
# ENV WORDPRESS_USER1_EMAIL=hehehe1@gmail.com

CMD ["/setup_wp.sh"]
