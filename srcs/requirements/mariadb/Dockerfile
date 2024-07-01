FROM debian:bullseye

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld \
    && mkdir -p /var/lib/mysql && chmod 777 /var/lib/mysql

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install mariadb-server -y

RUN chown mysql:mysql /var/lib/mysql

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./init_mariadb.sh /
RUN chmod +x /init_mariadb.sh

# ENV MYSQL_ROOT_PASSWORD=root_password
# ENV MYSQL_DATABASE=wp_database
# ENV WORDPRESS_USER1=wp_user1
# ENV WORDPRESS_USER1_PASSWORD=wp_user1_password
# ENV WORDPRESS_DB_HOST=localhost
# ENV WORDPRESS_DB_NAME=wp_database


EXPOSE 3306

CMD ["/init_mariadb.sh"]
