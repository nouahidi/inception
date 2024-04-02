#!/bin/bash

sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress

chmod -R 755 /var/www/wordpress/

chown -R root:root /var/www/wordpress

chown -R www-data:www-data /var/www/wordpress

wp core download --allow-root

mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php

sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf

wp config set --allow-root DB_NAME ${MYSQLDB} 
wp config set --allow-root DB_USER ${MSQLUSER}
wp config set --allow-root DB_PASSWORD ${MYSQLPASSWORD}
wp config set --allow-root DB_HOST "mariadb:3306"

wp core install --url=$W_DN --title=$W_TITLE --admin_user=$W_A_N --admin_password=$W_A_P --admin_email=$W_E_A --allow-root 

wp user create ${N_W_USER} ${N_W_EMAIL} --user_pass=$N_W_PASS --role=$N_W_ROLE --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F