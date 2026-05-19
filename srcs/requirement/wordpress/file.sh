#!/bin/bash

cd /var/www/html/wordpress

wp config create --dbname=wordpress --dbuser=aglid  --dbpass=aglid-2005 --dbhost=mariadb:3306  --allow-root

wp core install --url=slimane.42.fr --title=Inception --admin_user=soulaimane --admin_password=Soul1337@ --admin_email=soulaimanliman@gmail.com --allow-root

wp user create slimane limansoulaiman@gmail.com --role=subscriber --user_pass=slimane1337/ --allow-root

exec "$@"