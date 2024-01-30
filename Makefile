SRC=srcs/docker-compose.yml

build:
	docker-compose -f $(SRC) build
up:
	docker-compose -f $(SRC) up -d
down:
	docker-compose -f $(SRC) down
clean:
	docker-compose -f $(SRC) down -v
