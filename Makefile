COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all:
	sudo ${COMPOSE} build

up:
	sudo ${COMPOSE} up

upb:
	sudo ${COMPOSE} up --build

down:
	sudo ${COMPOSE} down

mariadb_login:
	mysql -u mariadbuser -peuYLV2N9GdInKS6lCQR9FbPc mariadb

mariadb_root:
	sudo ${COMPOSE} exec --user root mariadb /bin/bash

clean: down
	sudo rm -rf /home/gpirro/data/wordpress/*
	sudo rm -rf /home/gpirro/data/mariadb/*
	sudo docker stop $(shell sudo docker ps -qa); sudo docker rm $(shell sudo docker ps -qa); sudo docker rmi -f $(shell sudo docker images -qa); sudo docker volume rm $(shell sudo docker volume ls -q); sudo docker network rm $(shell sudo docker network ls -q) 2> /dev/null

