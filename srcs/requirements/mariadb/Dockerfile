FROM debian:bullseye

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld \
    && mkdir -p /var/lib/mysql && chmod 777 /var/lib/mysql

RUN apt-get update && apt-get upgrade \
	&& apt-get install -y mariadb-server 
# RUN mysql_secure_installation -y

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./init_mariadb.sh /

RUN chmod +x /init_mariadb.sh

ENV MYSQL_ROOT_PASSWORD=root_password
ENV	MYSQL_DATABASE=wordpress_database
ENV	WORDPRESS_USER1=wordpress_user1
ENV	WORDPRESS_USER1_PASSWORD=wordpress_user1_password
ENV	WORDPRESS_DB_HOST=mariadb
ENV	WORDPRESS_DB_NAME=WordPress_Database
ENV	WORDPRESS_USER1=wordpress_user1
ENV	WORDPRESS_USER1_PASSWORD=wordpress_user1_password

EXPOSE 3306

CMD ["/init_mariadb.sh"]
