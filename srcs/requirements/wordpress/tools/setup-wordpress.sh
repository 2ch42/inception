#!/bin/bash

mv -f /wordpress/* /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/wordpress
wp config set DB_NAME "'$MYSQL_DATABASE'" --raw --allow-root
wp config set DB_USER "'$MYSQL_USER'" --raw --allow-root
wp config set DB_PASSWORD "'$MYSQL_PASSWORD'" --raw --allow-root
wp config set DB_HOST "'$MYSQL_HOST'" --raw --allow-root
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
wp user create "$WP_USER" "$WP_USER_EMAIL" --user_pass="$WP_USER_PASSWORD" --allow-root

sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm start