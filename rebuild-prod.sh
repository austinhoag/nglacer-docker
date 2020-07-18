#! /bin/bash

## a simple script to remove crufty containers, assert a named docker network,
# build all dockercomposeable containers, and retag the cloudvolume and neuroglancer latest containers

#clear out the docker containers (running or not) relevant to this project
docker rm -f $(docker ps -a | grep "nglancerstatic-prod" | awk '{print $1}')
docker-compose -f docker-compose-prod.yml build 

## cleanup network to make sure a good fresh one exists
docker network rm lightserv-prod

docker network create --attachable lightserv-prod
