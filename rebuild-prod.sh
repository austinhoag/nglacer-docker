#! /bin/bash

## a simple script to remove crufty containers, assert a named docker network,
# build all dockercomposeable containers, and retag the cloudvolume and neuroglancer latest containers

#clear out the docker containers (running or not) relevant to this project
docker rm -f $(docker ps -a | grep "nglancerstatic-prod" | awk '{print $1}')
docker-compose -f docker-compose-prod.yml build 

# Create network if it does not already exist
docker network create --attachable lightserv-prod
