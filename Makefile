all:
	sudo docker-compose build

up:
	sudo docker-compose up

upb:
	sudo docker-compose up --build

down:
	sudo docker-compose down

clean: down
	sudo docker stop $(shell docker ps -qa); sudo docker rm $(shell docker ps -qa); sudo docker rmi -f $(shell docker images -qa); sudo docker volume rm $(shell docker volume ls -q); sudo docker network rm $(shell docker network ls -q) 2> /dev/null

