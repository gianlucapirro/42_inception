all:
	sudo docker-compose build

up:
	sudo docker-compose up

upb:
	sudo docker-compose up --build

down:
	sudo docker-compose down

clean: down
	sudo docker stop $(docker ps -qa); sudo docker rm $(docker ps -qa); sudo docker rmi -f $(docker images -qa); sudo docker volume rm $(docker volume ls -q); sudo docker network rm $(docker network ls -q) 2> /dev/null

