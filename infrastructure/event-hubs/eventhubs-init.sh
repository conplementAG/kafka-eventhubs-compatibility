#!/bin/bash

location=westeurope
rgName=eventhub-we-rg
eventHubName=testEventHub
eventHubNamespace=testEventHubNamespaceGzKras

#Create RG
az group create -l $location -n $rgName

#Create Event Hubs namespace
az eventhubs namespace create -l $location -g $rgName -n $eventHubNamespace --enable-kafka true --sku Standard

#Create EventHub
az eventhubs eventhub create -g $rgName -n $eventHubName --namespace-name $eventHubNamespace

#Create Authorization rule to publish and subscribe