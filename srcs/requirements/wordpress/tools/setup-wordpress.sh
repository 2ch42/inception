#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv /wordpress/* /var/www/html/wordpress
sleep 3
chown -R www-data:www-data /var/www/html/wordpress
sleep 3
rm -r /wordpress latest.tar.gz
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/define('DB_NAME', '.*');/define('DB_NAME', '$MYSQL_DATABASE');/" "/var/www/html/wordpress/wp-config.php"
sed -i "s/define('DB_USER', '.*');/define('DB_USER', '$MYSQL_USER');/" "/var/www/html/wordpress/wp-config.php"
sed -i "s/define('DB_PASSWORD', '.*');/define('DB_PASSWORD', '$MYSQL_PASSWORD');/" "/var/www/html/wordpress/wp-config.php"

mv /usr/local/bin/my.cnf /etc/php/7.4/fpm/
service php7.4-fpm start