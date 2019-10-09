# POC Kafka - Azure Event Hub with Kafka endpoint
Compatibility tests when switching from Kafka to Event Hubs with Kafka endpoint

## Getting Started
`git clone https://github.com/conplementAG/kafka-eventhubs-compatibility`

## Prerequisites
- Docker 
- Docker Compose (Included in Docker Desktop)

## Installing

#### Azure EventHubs

First you need to create an instance of EventHubs in Azure.

If you are not logged in Azure use `az login` from the cli.

Be sure to set the right subscription using `az account set --subscription xxxxxxxxx`.

Now you can change the parameter and run the script `eventhubs-init.sh` that sits on the `./infrastructure/event-hubs` folder.

This will create event hubs instance and output the neccessary information that you will need to follow along.

Note: Kafka endpoint is not enabled by default. The `eventhubs-init.sh` enables it.

#### Build docker image

From the root go to `./apps`
There you will find the producer and consumer applications written with Spring Boot framework. 

Inside the producer app run the following:
`docker build . -t producer:latest`

Inside the consumer app run the following:
`docker build . -t consumer:latest`

#### Start it with docker-compose

Docker compose will spin the following containers:
- Zookeeper 
- Kafka
- Kafka initializer for creating the topics
- Producer & Consmer that communicate with the local Kafka Cluster
- Producer & Consumer that communicate to Event Hubs instance

The containers that talk to Event Hubs instance require an `.env` file to hold up the credentials for Event Hubs.
Copy `.env.template` to `.env` file and fill the right information:
- `EVENTHUB_SERVER` requires FQDN:Port of Event Hubs instance e.g. `xxxxx.servicebus.windows.net:9093`
- `EVENTHUB_CONN_STRING` requires Connection string primary or secondary key. You can get it on the `Shared access policies` blade from the Event Hubs instance in Azure Portal.

After creating and filling the env files from the root folder you can start everything using
`docker-compose up`

### Testing

Each of the producers (one connecting to Kafka instance and the other connecting to Event Hubs) expose a REST API with the following endpoint: `/kafka/publish`

You can access them using:
- `localhost:8080/kafka/publish` producer connecting to local Kafka
- `localhost:8081/kafka/publish` producer connecting to Event Hubs instance

You can use Postman or curl to send a request POST request. It needs just one attribute called `message` of type String.
