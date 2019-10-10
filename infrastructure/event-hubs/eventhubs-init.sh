#!/bin/bash

#Create RG
az group create -l $LOCATION -n $RESOURCE_GROUP_NAME

#Create Event Hubs namespace
az eventhubs namespace create -l $LOCATION -g $RESOURCE_GROUP_NAME -n $EVENT_HUB_NAMESPACE --enable-kafka true --sku Standard

#Create EventHub
az eventhubs eventhub create -g $RESOURCE_GROUP_NAME -n $EVENT_HUB_NAME --namespace-name $EVENT_HUB_NAMESPACE

#Output keys for connection to event hubs instance
printf "\n Printing credentials \n"
az eventhubs namespace authorization-rule keys list --namespace-name $EVENT_HUB_NAMESPACE -n RootManageSharedAccessKey -g $RESOURCE_GROUP_NAME
