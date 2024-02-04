FROM debian:11

VOLUME /var/www/html/wordpress

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    rm -f /etc/nginx/sites-available/default

COPY conf/default /etc/nginx/sites-available/
COPY tools/setup-nginx.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-nginx.sh
RUN chmod 777 /etc/nginx/sites-available/default

ENTRYPOINT ["setup-nginx.sh"]