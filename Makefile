SRC=srcs/docker-compose.yml
DATA=/Users/changhyl/data
DB=/Users/changhyl/data/db
WP=/Users/changhyl/data/wp

all: up

vol:
	mkdir -p $(DATA)
	mkdir -p $(DB)
	mkdir -p $(WP)

build: vol
	docker-compose -f $(SRC) build

up: vol
	docker-compose -f $(SRC) up -d --build
down:
	docker-compose -f $(SRC) down
clean:
	docker-compose -f $(SRC) down -v
	rm -rf $(DB)
	rm -rf $(WP)
	docker system prune --volumes -f --all

.PHONY: all vol build up down clean
