
all : 
	sudo mkdir -p /home/slimane/data/db
	sudo mkdir -p /home/slimane/data/wp
	docker compose -f srcs/docker-compose.yml up --build -d
clean :
	docker compose -f srcs/docker-compose.yml stop
fclean : clean
	docker compose -f srcs/docker-compose.yml rm -f 

down: fclean
	docker compose -f srcs/docker-compose.yml down -v 

re : down all