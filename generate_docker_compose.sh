. env_vars.sh

rm docker-compose.yml
touch docker-compose.yml

echo "version: '3'
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
  web:
    build: .
    command: bash -c \"rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'\"
    volumes:
      - .:/$APP_NAME
    ports:
      - \"3000:3000\"
    depends_on:
      - db" > docker-compose.yml
