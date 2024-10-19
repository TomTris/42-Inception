NAME = ./srcs/docker-compose.yml

all:
	@printf "Running configuration $(NAME) ... \n"
	
	mkdir -p /home/qdo/data/wp_volasd2
	mkdir -p /home/qdo/data/mdb_volasd2
	docker-compose -f $(NAME) up -d
# Use these 2 lines if you have error UnixHTTPConnectionPool,
# increase it from 60 to more. This happens normally due to lacking resources.
# => need more time to process
# export DOCKER_CLIENT_TIMEOUT=150
# export COMPOSE_HTTP_TIMEOUT=150


ps:
	docker-compose -f $(NAME) ps

logs:
	docker-compose -f $(NAME) logs

build:
	@printf "building configuration $(NAME) ... \n"
	@docker-compose -f $(NAME) up -d --build

down:
	@printf "Stopping configuration $(NAME) ... \n"
	@docker-compose -f $(NAME) down -y

re:
	@printf "Rebuilding configuration $(NAME) ... \n"
	@docker-compose -f $(NAME) down -y
	@docker-compose -f $(NAME) up -d --build

clean: down
	@printf "Cleaninig  configuration $(NAME) ... \n"
	@docker stop $$(docker ps -qa)
	@docker system prune -a 

fclean:
	@printf "Complete clearning of all docker configuration ... \n"
	@docker stop $$(docker ps -qa);\
	docker system prune -a ;\
	docker system prune --all --force --volumes;\
	docker network prune --force;\
	docker volume rm srcs_db-volume;\
	docker volume rm srcs_wp-volume;
