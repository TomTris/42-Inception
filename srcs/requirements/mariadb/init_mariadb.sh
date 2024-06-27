#!/bin/bash
set -e

echo "CREATE USER '${WORDPRESS_DB_USER}'@'localhost' IDENTIFIED BY '${WORDPRESS_DB_USER_PASSWORD}';
CREATE DATABASE ${WORDPRESS_DB_NAME};
GRANT ALL PRIVILEGES ON '${WORDPRESS_DB_NAME}'.* 	TO '${WORDPRESS_DB_USER}'@'${WORDPRESS_DB_HOST}';
FLUSH PRIVILEGES;" > /run/mysql/init_db.sql

mariadb-install-db

exec mariadbd --user=mysql
