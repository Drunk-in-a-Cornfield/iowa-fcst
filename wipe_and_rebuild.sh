docker-compose down
docker volume rm iowa-fcst_database-data
docker rmi iowa-fcst_database:latest
docker rmi iowa-fcst_eda:latest
docker rmi iowa-fcst_mlservice:latest
docker rmi iowa-fcst_pgadmin:latest
docker system prune -f
docker-compose up --build -d
docker-compose logs -f