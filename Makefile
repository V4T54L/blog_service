install_migrate:
	sudo su
	curl -L https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add -
	echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/migrate.list
	apt-get update
	apt-get install -y migrate
	exit

pull_migrate_image:
	docker pull migrate/migrate

up:
	docker-compose -f docker-compose.yaml up -d

down:
	docker-compose -f docker-compose.yaml down

run_server:
	DATABASE_URL=postgresql://postgres:Password123@localhost:5432/moviesdb?sslmode=disable go run main.go