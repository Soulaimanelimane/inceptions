# dockerfile for nginx  conatainer 
FROM debian:bookworm

RUN  apt update &&  apt install -y nginx openssl


RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/key.pem \
    -out /etc/nginx/ssl/cert.pem \
    -days 365 \
    -nodes \
    -subj "/CN=slimane.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]