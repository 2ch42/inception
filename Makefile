SRC=srcs/docker-compose.yml

build:
	mkdir -p /Users/changhyl/data
	mkdir -p /Users/changhyl/data/db
	mkdir -p /Users/changhyl/data/wp
	docker-compose -f $(SRC) build
up:
	docker-compose -f $(SRC) up
down:
	docker-compose -f $(SRC) down
clean:
	docker-compose -f $(SRC) down -v

.PHONY: build up down clean