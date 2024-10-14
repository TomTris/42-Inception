#!/bin/bash

# Wait for SSL certificates to be generated
while [ ! -f /etc/nginx/ssl/server.crt ] || [ ! -f /etc/nginx/ssl/server.key ]; do
    echo "Waiting for SSL certificates..."
    sleep 2
done
sleep 2


# Start vsftpd
echo "vsftpd now starts!"
sleep 100000
vsftpd /etc/vsftpd.conf

# $? -ne 0 => $? not equal 0
if [ $? -ne 0 ]; then
    echo "vsftpd failed to start!"
    exit 1
else
    echo "vsftpd started successfully!"
fi