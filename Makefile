all:
	sudo docker-compose build

up:
	sudo docker-compose up

upb:
	sudo docker-compose up --build

down:
	sudo docker-compose down

clean: down
	sudo docker stop $(sudo docker ps -qa); sudo docker rm $(sudo docker ps -qa); sudo docker rmi -f $(sudo docker images -qa); sudo docker volume rm $(sudo docker volume ls -q); sudo docker network rm $(sudo docker network ls -q) 2> /dev/null

