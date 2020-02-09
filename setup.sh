export APP_NAME=bar_foo
echo APP_NAME=$APP_NAME

touch Gemfile.lock
docker-compose run web rails new . --force --no-deps --database=postgresql
docker-compose build --build-arg dockerfile_app_name=$APP_NAME
cp new_database_config.yml config/database.yml
rm new_database_config.yml
docker-compose run web rake db:create


