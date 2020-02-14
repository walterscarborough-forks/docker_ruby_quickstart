# Docker Ruby Quickstart
Files from https://docs.docker.com/compose/rails/

Clone the repo
```
git clone https://github.com/ericadohring/docker_ruby_quickstart.git && cd docker_ruby_quickstart
```

(Optional) Name Your App - modify the APP_NAME variable in env_vars.sh. It will default to myapp
```
APP_NAME=my_cool_app
```


Run setup
```
sh ./setup.sh
```

Start up the app
```
docker-compose up
```

Head over to http://localhost:3000 to see the hello wold rails app 
