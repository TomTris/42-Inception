NAME = ./srcs/docker-compose.yml

all:
	@printf "Running configuration $(NAME) ... \n"
	mkdir -p ~/home/qdo/data/wp_vol
	mkdir -p ~/home/qdo/data/mdb_vol
	@docker-compose -f $(NAME) up -d

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
