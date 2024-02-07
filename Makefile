SRC=srcs/docker-compose.yml
DB=/Users/changhyl/data/db
WP=/Users/changhyl/data/wp

build:
	mkdir -p /Users/changhyl/data
	mkdir -p /Users/changhyl/data/db
	mkdir -p /Users/changhyl/data/wp
	docker-compose -f $(SRC) build
up:
	make build
	docker-compose -f $(SRC) up
down:
	docker-compose -f $(SRC) down
clean:
	docker-compose -f $(SRC) down -v
	rm -rf $(DB)
	rm -rf $(WP)
	docker system prune -f --all
	@docker volume rm -f $$(docker volume ls -q)

.PHONY: build up down clean
