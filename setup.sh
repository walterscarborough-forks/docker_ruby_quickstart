sh ./generate_custom_app_name_files.sh

touch Gemfile.lock
docker-compose run web rails new . --force --no-deps --database=postgresql
docker-compose build
cp new_database_config.yml config/database.yml
rm new_database_config.yml
docker-compose run web rake db:create


