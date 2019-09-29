#!/bin/bash

uid=1005
gid=1017


app_name=plex
docker_configVolume=plex_config
docker_mediaVolume=media_r
local_tanscodePath=/srv/transcode
nfs_app=plex

# We create a docker volume for the config files as not to accidentally delete it with docker rm -f
if docker volume ls | grep $docker_configVolume >/dev/null 2>&1  ; then
        echo "volume $docker_configVolume already exists, skipping creation"
else
        docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,rw --opt device=:/mnt/lambo/container-configs/$app_name $docker_configVolume
fi

if docker volume ls |grep $docker_mediaVolume >/dev/null 2>&1; then
	echo "volume $docker_mediaVolume already exists, skipping creation."
else
	docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,ro --opt device=:/mnt/media $docker_mediaVolume
fi


echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $docker_configVolume:/config \
-v $docker_mediaVolume:/data \
-v $local_tanscodePath:/transcode \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 32400:32400 \
linuxserver/plex
