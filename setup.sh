touch Gemfile.lock
docker-compose run web rails new . --force --no-deps --database=postgresql  --build-arg app_name=foo_bar
docker-compose build --build-arg app_name=foo_bar
cp new_database_config.yml config/database.yml
rm new_database_config.yml
docker-compose run web rake db:create


