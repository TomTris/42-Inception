#!/bin/sh

service mariadb start
sleep 5

echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\` ;" > script.sql
echo "CREATE USER IF NOT EXISTS '${WORDPRESS_USER1}'@'%' IDENTIFIED BY '${WORDPRESS_USER1_PASSWORD}';" >> script.sql
echo "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${WORDPRESS_USER1}'@'%';" >> script.sql
# echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> script.sql
echo "FLUSH PRIVILEGES;" >> script.sql

mysql < script.sql

# if [ ! -f /var/lib/mysql/.mysql_secure_installed ]; then
# 	mysql_secure_installation << LIMITER
# 	$MYSQL_ROOT_PASSWORD
# 	n
# 	n
# 	y
# 	y
# 	y
# 	y
# LIMITER
#     touch /var/lib/mysql/.mysql_secure_installed
# fi

service mariadb stop
sleep 5	
exec mariadbd --user=mysql
# exec mariadbd --user=mysql --bootstrap
