FROM debian:bullseye

RUN  apt-get update && apt-get upgrade -y \
    && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/server.key\
	-out    /etc/nginx/ssl/server.crt\
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/CN=qdo" \
	&& rm -rf /var/lib/apt/lists/*

# openssl x509 -in /etc/nginx/ssl/server.crt  -text -noout -to see subj
EXPOSE 443

# to change 80 => 443, add ssl, add encryption algorithm, turn off gzip and redirect request to wordpress's fpm.
# other scriptname or "include" is already included in side avalable config files.
COPY ./default /etc/nginx/sites-enabled/default

# run nginx on foreground
CMD nginx -g "daemon off;"