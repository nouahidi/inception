#!/bin/bash

service mariadb start

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQLDB}.* TO \`${MSQLUSER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQLROOTPASSWORD}';"
mysql -u root -p$MYSQLROOTPASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQLROOTPASSWORD shutdown

exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'