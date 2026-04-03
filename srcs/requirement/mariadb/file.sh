#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE wordpress;"

mysql -e "CREATE USER 'aglid'@'%' IDENTIFIED BY 'aglid';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'aglid'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE USER 'isemg'@'%' IDENTIFIED BY 'isemg';"
mysql -e "GRANT INSERT SELECT UPDATE DELETE   ON wordpress.* TO 'isemg'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe