FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm php-mysql php-gd php-xml \
    curl wget tar \
    gnupg2 \
    && apt-get clean\
    && rm -rf /var/lib/apt/lists/*
#curl: using URLs to send data, wget download by link, tar - i
#gnupg2 is for encryp and decrypting data, files .bla bla

RUN apt-get update && apt-get install -y \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O wordpress.tar.gz https://wordpress.org/latest.tar.gz\
    && mkdir -p var/www/ \
    && tar -xzf wordpress.tar.gz -C /var/www/ \
    && rm wordpress.tar.gz \
    && chown -R www-data:www-data /var/www/wordpress

#wget -q: quite = no unecessary infos, -O...= outgut file name
#tar -zxf ... -C /var/www/ -> unzip, put it to /var/www/
#chown recursively to /var/www/wordpres -> webserve change it easily

# Set environment variables for WordPress
# COPY ./wp-config.php  /var/www/wordpress
COPY ./init-wp.sh  /var/www/

EXPOSE 9000

CMD ["/var/www/init-wp.sh"]