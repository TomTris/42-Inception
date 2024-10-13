#!/bin/sh

if [ ! -f /var/lib/mysql/.mysql_secure_installed ]; then
service mariadb start
sleep 5

echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\` ;" > script.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER1}'@'%' IDENTIFIED BY '${MYSQL_USER1_PASSWORD}';" >> script.sql
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER1}'@'%';" >> script.sql
# echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> script.sql
echo "FLUSH PRIVILEGES;" >> script.sql

mysql < script.sql

touch /var/lib/mysql/.mysql_secure_installed

service mariadb stop
sleep 5	
fi

exec mariadbd --user=mysql
