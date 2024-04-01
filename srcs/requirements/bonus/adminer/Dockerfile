FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt -y install php php-mysql && apt install -y wget \
    && wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php

CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]