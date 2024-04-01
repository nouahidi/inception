#!/bin/bash

service mariadb start

sleep 10

mysql -u root -p"${MYSQLROOTPASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;
CREATE USER IF NOT EXISTS \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO \`${MSQLUSER}\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQLROOTPASSWORD}';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"${MYSQLROOTPASSWORD}" shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'