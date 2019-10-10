#!/bin/bash

# The user is the user marc on freenas and the media_rw group
uid=1005
gid=1017

app_name=sonarr
confVolume=sonarr_config
completeVolume=complete_rw
seriesVolume=series_rw

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $confVolume:/config \
-v $completeVolume:/downloads \
-v $seriesVolume:/tv \
-v /etc/localtime:/etc/localtime:ro \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 8989:8989 \
linuxserver/sonarr
