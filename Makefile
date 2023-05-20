all:
	docker-compose build

up:
	docker-compose up

upb:
	docker-compose up --build

down:
	docker-compose down

clean: down
	sudo docker stop $(docker ps -qa); sudo docker rm $(docker ps -qa); sudo docker rmi -f $(docker images -qa); sudo docker volume rm $(docker volume ls -q); sudo docker network rm $(docker network ls -q) 2> /dev/null

