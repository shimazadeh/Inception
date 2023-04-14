NAME = inception

all: inception

${NAME}: volume build up

build:
		docker compose -f ./srcs/docker-compose.yml build
volume:
		sudo mkdir -p /home/shabibol/data/db_data
		sudo mkdir -p /home/shabibol/data/wordpress

up:
		docker-compose -f ./srcs/docker-compose.yml up -d

down:
		docker-compose -f ./srcs/docker-compose.yml down

clean:
		docker-compose -f ./srcs/docker-compose.yml down
		docker container prune --force

fclean:
		docker-compose -f ./srcs/docker-compose.yml down
		docker container prune --force
		sudo rm -rf /home/shabibol/data
		docker volume ls -qf dangling=true | xargs -r docker volume rm
		docker network prune --force
		docker volume prune --force

re: fclean all

.PHONY: all volume up down clean fclean re
