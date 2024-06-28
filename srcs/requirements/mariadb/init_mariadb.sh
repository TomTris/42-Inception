#!/bin/sh
service mariadb start
sleep 5

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" > script.sql
echo "CREATE USER IF NOT EXISTS'${WORDPRESS_USER1}'@'${WORDPRESS_DB_HOST}' IDENTIFIED BY '${WORDPRESS_USER1_PASSWORD}';" >> script.sql;
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${WORDPRESS_USER1}'@'${WORDPRESS_DB_HOST}';" >> script.sql;
echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> setup.sql
echo "FLUSH PRIVILEGES;" >> script.sql;
mysql < script.sql

mysql -u root < script.sql

service mariadb stop

sleep 5

exec mysqld
