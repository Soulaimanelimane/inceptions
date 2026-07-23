#!/bin/bash

cd /var/www/html/wordpress

echo "Waiting for MariaDB to be ready..."
sleep 10
echo "MariaDB is fully booted and ready!"

wp config create --dbname=$DB_NAME --dbuser=$USER_NAME  --dbpass=$WP_USER_PASS --dbhost=mariadb:3306  --allow-root

wp core install --url=$URL --title=Inception --admin_user=$WP_AD_USER --admin_password=$WP_PS_USER --admin_email=$WP_USER_EMAIL --allow-root

wp user create $WP_USER $WP_EMAIL  --role=subscriber --user_pass=$WP_PASS --allow-root

exec "$@"