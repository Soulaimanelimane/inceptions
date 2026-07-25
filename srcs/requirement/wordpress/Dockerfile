FROM debian:bookworm
 
RUN apt update &&  apt install -y  php  php-fpm  php-mysql mariadb-client curl && curl -O https://wordpress.org/wordpress-6.8.tar.gz  && tar -xf wordpress-6.8.tar.gz -C  /var/www/html/  && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY config/wp.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./file.sh  /file.sh


RUN chmod +x /file.sh


ENTRYPOINT ["/file.sh"]
CMD ["php-fpm8.2", "-F"]

