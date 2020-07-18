#! /bin/bash

## a simple script to remove crufty containers, assert a named docker network,
# build all dockercomposeable containers, and retag the cloudvolume and neuroglancer latest containers

#clear out the docker containers (running or not) relevant to this project
docker rm -f $(docker ps -a | grep "nglancerstatic_bc00" | awk '{print $1}')
docker-compose -f docker-compose-static.yml build 

## cleanup network to make sure a good fresh one exists
docker network rm nglancer_bc00

docker network create --attachable nglancer_bc00
