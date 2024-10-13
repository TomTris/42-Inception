FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

# when we install mariadb server,
# 0. mysql user is created and file /var/lib/mysql is already owned by mysql user automatically
# 1. no need to change 50-server-cnf or add port 3306 since it's default, but bind 0.0.0.0 
# to enable connection from wordpress
# 2. need to initialize mariadb, create an instance user and database for storing wordpress's data

EXPOSE 3306

COPY ./init_mariadb.sh /
RUN chmod +x /init_mariadb.sh

COPY ./50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["/init_mariadb.sh"]
