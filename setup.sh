touch Gemfile.lock
docker-compose run web rails new . --force --no-deps --database=postgresql
docker-compose build
cp new_database_config.yml config/database.yml
rm new_database_config.yml
docker-compose up -d

sleep 15

docker-compose run web rake db:create

