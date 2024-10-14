FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

# install very secure ftp daemon because Package 'ftp-server' has no installation candidate
# ftp-server is not a direct package. Instead, it’s a "virtual package" representing several possible FTP server implementations
RUN apt-get install vsftpd -y
#  apt-get install ftp-server