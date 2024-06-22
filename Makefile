name = simple_nginx_html

all:
	@printf "Running configuration ${name} ... \n"
	@docker-compose -f./docker-compose.yml up -d

build:

	@printf "building configuration ${name} ... \n"
	@docker-compose -f ./docker-compose.yml up -d --build

down:
	@printf "Stopping configuration ${name} ... \n"
	@docker-compose -f ./docker-compose.yml down

re:
	@printf "Rebuilding configuration ${name} ... \n"
	@docker-compose -f ./docker-compose.yml -d --build

clean: down
	@printf "Cleaninig  configuration ${name} ... \n"
	@docker system prune -a

fclean:
	@printf "Complete clearning of all docker configuration ... \n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
#docker network prune --force
#docker volume prune --force

.PHONY : all build down re clean fclean

