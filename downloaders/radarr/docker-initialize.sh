#!/bin/bash

# The user is the user marc on freenas and the media_rw group
uid=1005
gid=1017

app_name=radarr
confVolume=radarr_config
completeVolume=complete_rw
movieVolume=movies_rw

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $confVolume:/config \
-v $completeVolume:/downloads \
-v $movieVolume:/movies \
-v /etc/localtime:/etc/localtime:ro \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 7878:7878 \
linuxserver/radarr
