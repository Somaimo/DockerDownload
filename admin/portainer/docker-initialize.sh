#!/bin/bash

app_name=portainer
docker_configVolume=portainer_data

# Portainer requires one volume, one for its configuration and an additional bindmount of the docker socket.
# This script doesn't test if the volumes exist, but the docker run command will fail if
# they don't exist.

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $docker_configVolume:/data \
-v /var/run/docker.sock:/var/run/docker.sock \
-p 8000:8000 \
-p 9000:9000 \
--restart unless-stopped \
portainer/portainer:latest
