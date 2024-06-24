FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt install mariadb-server -y

EXPOSE 3306

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["/bin/bash"]
