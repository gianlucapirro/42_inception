all:
	sudo docker-compose build

up:
	sudo docker-compose up

upb:
	sudo docker-compose up --build

down:
	sudo docker-compose down

mariadb_login:
	mysql -u mariadbuser -pabc mariadb


clean: down
	rm -rf /home/jsiegers/data/wordpress/*
	rm -rf /home/jsiegers/data/mariadb/*
	sudo docker stop $(shell sudo docker ps -qa); sudo docker rm $(shell sudo docker ps -qa); sudo docker rmi -f $(shell sudo docker images -qa); sudo docker volume rm $(shell sudo docker volume ls -q); sudo docker network rm $(shell sudo docker network ls -q) 2> /dev/null

