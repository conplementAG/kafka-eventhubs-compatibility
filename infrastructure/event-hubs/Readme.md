docker build -t eventhubsinit:latest
docker run -it --rm eventshubsinit:latest

az login
set right subscription

run ./eventhubs-init.sh

Event Hubs namespace needs to be Standard, Basic dosent support Kafka