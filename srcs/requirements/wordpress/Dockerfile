FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx  php php-fpm  php-mysql  curl  wget  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR var/www/html
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz && \
    chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/php && chown www-data:www-data /run/php
COPY wp-config-sample.php /var/www/html/wp-config-sample.php

EXPOSE 9000

CMD exec php-fpm7.4 -F