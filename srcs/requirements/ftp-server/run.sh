#!/bin/bash

echo "ftp sript is running"
while [ ! -f /etc/nginx/ssl/server.crt ] || [ ! -f /etc/nginx/ssl/server.key ]; do
    sleep 2
    echo "Waiting for SSL certificates..."
done

sleep 1

if [ ! -f /vstfp_done ]; then
    echo "Creating user!"
    useradd -m -d /var/www/html/ ${VSFTPUSER} && echo ${VSFTPUSER}:${VSFTPPASS} | chpasswd
    # Start vsftpd
    echo "vsftpd now starts!"
    chown vsftpd:vsftpd /var/www/html/
    vsftpd /etc/vsftpd.conf
else
    echo "vsftpd is already started before, using the available vsftpd.conf."
fi

# $? -ne 0 => $? not equal 0
if [ $? -ne 0 ]; then
    echo "vsftpd failed to start!"
    exit 1
else
    echo "vsftpd started successfully!"
fi
