#!/bin/bash

uid=1005
gid=1017

app_name=sabnzbd
confVolume=sabnzbd_config
completeVolume=complete_rw
incompleteVolume=incomplete-sabnzbd_rw

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $confVolume:/config \
-v $completeVolume:/downloads \
-v $incompleteVolume:/incomplete-downloads \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 8080:8080 \
--restart unless-stopped \
linuxserver/sabnzbd
