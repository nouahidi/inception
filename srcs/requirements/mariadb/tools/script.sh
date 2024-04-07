#!/bin/bash

service mariadb start

while ! mysqladmin ping -hlocalhost --silent; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`; \
          CREATE USER IF NOT EXISTS \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}'; \
          GRANT ALL PRIVILEGES ON ${MYSQLDB}.* TO \`${MSQLUSER}\`@'%'; \
          ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQLROOTPASSWORD}';"

mysql -u root -p$MYSQLROOTPASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQLROOTPASSWORD shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'