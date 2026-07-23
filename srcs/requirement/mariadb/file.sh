#!/bin/bash

mysqld_safe --skip-networking &

until mysqladmin ping --silent; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mysql -e "CREATE USER IF NOT EXISTS 'aglid'@'%' IDENTIFIED BY 'aglid-2005';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'aglid'@'%';"

# mysql -e "CREATE USER IF NOT EXISTS 'isemg'@'%' IDENTIFIED BY 'isemg-1337';"
# mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress.* TO 'isemg'@'%';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe