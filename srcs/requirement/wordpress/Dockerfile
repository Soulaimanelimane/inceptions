# dockerfile for wordpress conatainer 
FROM debian:bookworm

RUN apt update &&  apt install -y  php  php-fpm  php-mysql  curl && curl -O https://wordpress.org/wordpress-6.8.tar.gz  && tar -xf wordpress-6.8.tar.gz -C  /var/www/html/  && apt install -y iproute2 

COPY config/wp.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD ["php-fpm8.2", "-F"]

