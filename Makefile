all:
	docker-compose build

up:
	docker-compose up

upb:
	docker-compose up --build

down:
	docker-compose down

clean: down
	docker volume rm 42_inception_mariadb_data 42_inception_wordpress_files
