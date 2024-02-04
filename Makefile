SRC=srcs/docker-compose.yml

build:
	mkdir -p /Users/changhyl/data
	mkdir -p /Users/changhyl/data/db
	mkdir -p /Users/changhyl/data/wp
	docker-compose -f $(SRC) build
up:
	docker-compose -f $(SRC) up -d
down:
	docker-compose -f $(SRC) down
clean:
	docker-compose -f $(SRC) down -v
