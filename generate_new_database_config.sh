. env_vars.sh

rm new_database_config.yml
touch new_database_config.yml

echo "default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: ${APP_NAME}_development


test:
  <<: *default
  database: ${APP_NAME}_test" > new_database_config.yml
