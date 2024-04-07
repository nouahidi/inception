#!/bin/bash

sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp-cli

cd /var/www/wordpress

chmod -R 777 /var/www/wordpress/

wp-cli core download --allow-root

mv /var/www/wordpress/wp-config-sample.php  /var/www/wordpress/wp-config.php

sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf

wp-cli config set --allow-root DB_NAME ${MYSQLDB} 
wp-cli config set --allow-root DB_USER ${MSQLUSER}
wp-cli config set --allow-root DB_PASSWORD ${MYSQLPASSWORD}
wp-cli config set --allow-root DB_HOST "mariadb:3306"

wp-cli core install --url=$DOMAINNAME --title=$TITLE --admin_user=$ADMINNAME --admin_password=$ADMINPASSWORD --admin_email=$ADMINEMAIL --allow-root 

wp-cli user create ${NEWUSER} ${NEWEMAIL} --user_pass=$NEWPASS --role=$NEWROLE --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F