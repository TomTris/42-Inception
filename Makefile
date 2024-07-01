NAME = ./srcs/docker-compose.yml

all:
	@printf "Running configuration $(NAME) ... \n"
	mkdir -p ~/home/${USER}/data/wordpress_volume
	mkdir -p ~/home/${USER}/data/mariadb_volume
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
	@docker system prune -a

fclean: clean
	@printf "Complete clearning of all docker configuration ... \n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	rm -rf ~/home/${USER}/data/wordpress_volume
	rm -rf ~/home/${USER}/data/mariadb_volume


.PHONY : all build down re clean fclean

 