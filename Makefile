all:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

clean: down
	docker volume rm my_project_mariadb_data my_project_wordpress_files
