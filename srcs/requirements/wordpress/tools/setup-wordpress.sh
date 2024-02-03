#!/bin/bash

mv -f /wordpress/* /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

#sed -i "s/define('DB_NAME', '.*');/define('DB_NAME', '$MYSQL_DATABASE');/" "/var/www/html/wordpress/wp-config.php"
#sed -i "s/define('DB_USER', '.*');/define('DB_USER', '$MYSQL_USER');/" "/var/www/html/wordpress/wp-config.php"
#sed -i "s/define('DB_PASSWORD', '.*');/define('DB_PASSWORD', '$MYSQL_PASSWORD');/" "/var/www/html/wordpress/wp-config.php"
sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf
service php7.4-fpm start