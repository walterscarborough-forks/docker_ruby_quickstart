# Docker Ruby Quickstart
Files from https://docs.docker.com/compose/rails/

Clone the repo and create an empty Gemfile
```
git clone https://github.com/ericadohring/docker_ruby_quickstart.git && cd docker_ruby_quickstart
touch Gemfile.lock
```

Rails new it up 
```
docker-compose run web rails new . --force --no-deps --database=postgresql
```

Once that finishes, run 
```
docker-compose build
```

Next, copy over the database config file
```
cp new_database_config.yml config/database.yml
rm new_database_config.yml
```

Start up the app
```
docker-compose up
```

Lastly, open up a new tab, cd into the directory, and run to create the db
```
docker-compose run web rake db:create
```

Head over to http://localhost:3000 to see the hello wold rails app 
