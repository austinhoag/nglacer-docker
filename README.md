# Neuroglancer Frame
This is a small `docker` + `docker-compose` based solution for running the [neuroglancer volumetric viewer](https://github.com/seung-lab/neuroglancer). 

## Requirements
* Docker: A modern version of [docker appropriate to the OS](https://docs.docker.com/install/#supported-platforms) needs to be installed.
* docker-compose: A recent version of [docker-compose](https://docs.docker.com/compose/install/#install-compose) must be installed as the compose file included with this package uses a relatively new format version to allow for the `.env` file support to work.

## Usage
The script `./rebuild-all.sh` builds the container. See the `nglancerstatic/nglancerstatic.Dockerfile` which defines the docker image. This will take a bit of time but should not need to be done again unless pulling new updates from this repo. Launch the container with `docker-compose up`. 

The container runs neuroglancer at port 8080 inside the container, and you can map that port to whatever you want on your local machine. In `docker-compose.yml`, the network `nglancer` is used such that this service can be seen at port 8080 by any other docker containers running inside that network.   

