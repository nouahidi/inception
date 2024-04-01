FROM debian:bullseye


RUN apt  update && apt  upgrade -y && apt  install curl -y && \
    apt install php php-fpm php-mysql mariadb-client wget -y && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

COPY /conf/config.sh /

RUN  chmod +x config.sh

CMD [ "./config.sh" ]