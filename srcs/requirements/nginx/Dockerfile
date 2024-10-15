FROM debian:bullseye

RUN  apt-get update && apt-get upgrade -y \
    && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/server.key\
	-out    /etc/nginx/ssl/server.crt\
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/CN=qdo" \
	&& rm -rf /var/lib/apt/lists/*

RUN chmod 777 /etc/nginx/ssl/server.key
RUN chmod 777 /etc/nginx/ssl/server.crt
# openssl x509 -in /etc/nginx/ssl/server.crt  -text -noout -to see subj
EXPOSE 443

# to change 80 => 443, add ssl, add encryption algorithm, turn off gzip and redirect request to wordpress's fpm.
# other scriptname or "include" is already included in side avalable config files.
COPY ./default /etc/nginx/sites-enabled/default
RUN mkdir -p /var/www/html

# for static file
COPY ./github.png /github.png
COPY ./graph.png /graph.png
COPY ./intra.png /intra.png
COPY ./linkedin.png /linkedin.png
COPY ./lake.gif /lake.gif
COPY ./qdo.html /qdo.html


COPY run.sh /run.sh
RUN chmod 744 /run.sh
# run nginx on foreground
CMD ["/run.sh"]