FROM nginx:latest

# apt-get unstall -y nginx
# RUN apt-get update && apt-get install -y nginx openssl curl
## && rm -rf /var/lib/apt/lists/

RUN mkdir -p /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/server.key\
	-out    /etc/nginx/ssl/server.crt\
	-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42Heilbronn/CN=qdo"

#openssl x509 -in /etc/nginx/ssl/server.crt  -text -noout

EXPOSE 80
EXPOSE 443

COPY ./default /etc/nginx/config.d/default.conf

CMD ["/bin/bash"]