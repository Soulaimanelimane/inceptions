# dockerfile for mariadb conatainer 
FROM debian:bookworm

RUN apt update &&  apt install -y mariadb-server mariadb-client 
RUN chown -R mysql:mysql /var/lib/mysql


COPY ./my_mariadb.conf /etc/mysql/mariadb.cnf

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./file.sh /container_file.sh
RUN  chmod +x /container_file.sh 
ENTRYPOINT ["/container_file.sh"]
CMD ["mysql"]