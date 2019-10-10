# Creating event hubs instance

* Copy `.env.template` to `.env` and change the values as you see fit 
* Run `docker build -t eventhubsinit:latest .`
* Run `docker run -it --rm --env-file .env eventhubsinit:latest`
* After landing in the container shell run `az login` and login to azure
* Run `./eventhubs-init.sh`. At the end it will pring the credentials that you will need to put on the `.env` file on the root project

Event Hubs namespace needs to be Standard, Basic dosent support Kafka