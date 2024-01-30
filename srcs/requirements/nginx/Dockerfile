FROM debian:11

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup-nginx.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-nginx.sh

CMD ["setup-nginx.sh"]