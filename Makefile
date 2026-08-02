
all : 
	mkdir -p /home/slimane/data/db
	mkdir -p /home/slimane/data/wp
	docker compose up --build -d 
clean :
	docker compose stop
fclean : clean
	docker compose rm -f 

down: fclean
	docker compose down -v 

re : down all