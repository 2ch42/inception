FROM debian:11

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-client \
    php7.4 \
    php-fpm \
    php-cli \
    wget \
    curl \
    php-mysql \
    php-mbstring \
    php-xml \
    sendmail

COPY tools/setup-wordpress.sh /usr/local/bin/
COPY conf/my.cnf /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-wordpress.sh

VOLUME /var/www/html/wordpress

ENTRYPOINT ["/usr/local/bin/setup-wordpress.sh"]