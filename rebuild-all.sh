#! /bin/bash

## a simple script to remove crufty containers, assert a named docker network,
# build all dockercomposeable containers, and retag the cloudvolume and neuroglancer latest containers


#clear out the docker containers (running or not) relevant to this project
docker rm -f $(docker ps -a | grep "nglancerstatic" | awk '{print $1}')
docker-compose build

## cleanup network to make sure a good fresh one exists
docker network rm nglancer

docker network create --attachable nglancer
