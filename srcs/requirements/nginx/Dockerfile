FROM debian:bullseye

RUN apt update &&  apt install nginx openssl -y \
    && mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/nginx.crt -keyout \
    /etc/nginx/ssl/nginx.key -subj "/C=MO/ST=KHOURIBGA/L=KHOURIBGA/O=1337/OU=1337/CN=nouahidi.42.fr/UID=nouahidi"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress

ENTRYPOINT ["nginx", "-g", "daemon off;"]