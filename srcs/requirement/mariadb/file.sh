#!/bin/bash

mysqld_safe &

# Wait until MariaDB is ready
until mysqladmin ping --silent; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"

mysql -e "CREATE USER IF NOT EXISTS 'aglid'@'%' IDENTIFIED BY 'aglid-2005';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'aglid'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE USER IF NOT EXISTS 'isemg'@'%' IDENTIFIED BY 'isemg-1337';"
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE   ON wordpress.* TO 'isemg'@'%';"
mysql -e "FLUSH PRIVILEGES;"

wait 
