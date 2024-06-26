FROM debian:bullseye

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

RUN apt-get update && apt-get upgrade \
	&& apt-get install mariadb-server -y
#	&& rm -rf /var/lib/apt/lists/*

# COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY ./init_mariadb.sh /run/mysql/

# RUN chmod 777 /run/mysql/init_mariadb.sh

# EXPOSE 3306

# CMD ["/run/mysql/init_mariadb.sh"]
CMD ["/bin/bash"]
# 
