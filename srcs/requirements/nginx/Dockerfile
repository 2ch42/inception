FROM debian:11

# VOLUME /var/www/html/wordpress

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    rm -f /etc/nginx/sites-available/default

COPY conf/default /etc/nginx/sites-available/

RUN chmod 777 /etc/nginx/sites-available/default && \
    openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=learner/CN=changhyl" -keyout /etc/ssl/private/changhyl_p.key -out /etc/ssl/certs/changhyl.crt && \
    chmod 600 /etc/ssl/certs/changhyl.crt /etc/ssl/private/changhyl_p.key

ENTRYPOINT ["nginx","-g","daemon off;"]