FROM debian:11

VOLUME /var/www/html/wordpress

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

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz

COPY tools/setup-wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-wordpress.sh && \
    mv /wordpress/wp-config-sample.php /wordpress/wp-config.php

ENTRYPOINT ["/usr/local/bin/setup-wordpress.sh"]