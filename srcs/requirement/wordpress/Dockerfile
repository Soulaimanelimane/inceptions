# dockerfile for wordpress conatainer 
FROM debian:bookworm

RUN apt update &&  apt install -y  php  php-fpm  php-mysql  curl && curl -O https://wordpress.org/wordpress-6.8.tar.gz  && tar -xf wordpress-6.8.tar.gz -C  /var/www/html/ 



CMD ["php-fpm8.2", "-F"]

