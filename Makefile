all: up

up:
	mkdir   -p /home/nouahidi/data/wordpress /home/nouahidi/data/mariadb 
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down :
	docker-compose -f ./srcs/docker-compose.yml down

clean : down
	sudo rm -rf /home/nouahidi/data/wordpress /home/nouahidi/data/mariadb
