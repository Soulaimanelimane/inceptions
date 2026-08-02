FROM debian:bookworm

RUN apt update &&  apt install -y mariadb-server mariadb-client 
RUN chown -R mysql:mysql /var/lib/mysql



RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf


COPY ./file.sh  /usr/local/bin/container_file.sh
RUN  chmod +x  /usr/local/bin/container_file.sh 

ENTRYPOINT ["/usr/local/bin/container_file.sh"]