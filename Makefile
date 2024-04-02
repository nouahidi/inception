all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up --build

down :
	docker-compose -f ./srcs/docker-compose.yml down
