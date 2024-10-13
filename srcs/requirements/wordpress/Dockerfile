FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y php php7.4-fpm php-gd wget php-mysqli 

RUN mkdir -p /var/www/html /run/php

# store data in here, it match nginx
RUN chown -R www-data:www-data /var/www/html

# for pid = /run/php/php7.4-fpm.pid in /etc/php/7.4/fpm/php-fpm.conf
RUN chown -R www-data:www-data /run/php


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
	
RUN apt-get install nano
WORKDIR /var/www/html

# change listen to 0.0.0.0 to get request from nginx
COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

# to gain access to mariadb, create an admin and a user for wordpress
COPY ./wp_init.sh /setup_wp.sh
RUN  chmod +x /setup_wp.sh

EXPOSE 9000

CMD ["/setup_wp.sh"]
