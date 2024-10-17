#!/bin/bash

# Wait for SSL certificates to be generated
while [ ! -f /etc/nginx/ssl/server.crt ] || [ ! -f /etc/nginx/ssl/server.key ]; do
    sleep 2
    echo "Waiting for SSL certificates..."
done

sleep 2

useradd -m -d /var/www/html/ ${VSFTPUSER} && echo ${VSFTPUSER}:${VSFTPPASS} | chpasswd
# Start vsftpd
echo "vsftpd now starts!"
vsftpd /etc/vsftpd.conf

# $? -ne 0 => $? not equal 0
if [ $? -ne 0 ]; then
    echo "vsftpd failed to start!"
    exit 1
else
    echo "vsftpd started successfully!"
fi
