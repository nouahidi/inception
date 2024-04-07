FROM debian:bullseye

RUN apt update && apt upgrade -y && apt -y install mariadb-server

COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT [ "./script.sh" ]