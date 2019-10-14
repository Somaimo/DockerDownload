#!/bin/bash

uid=1005
gid=1017


app_name=plex
docker_configVolume=plex_config
docker_mediaVolume=media_rw
local_tanscodePath=/srv/transcode
nfs_app=plex

# Plex requires two volumes, one for its configuration and one for media access (rw).
# This script doesn't test if the volumes exist, but the docker run command will fail if
# they don't exist.

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $docker_configVolume:/config \
-v $docker_mediaVolume:/data \
-v $local_tanscodePath:/transcode \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 32400:32400 \
linuxserver/plex
