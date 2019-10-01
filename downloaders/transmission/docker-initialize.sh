#!/bin/bash

uid=1005
gid=1017

app_name=transmission
confVolume=transmission_config
completeVolume=complete_rw
dropfolderVolume=dropfolder-transmission_rw

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $confVolume:/config \
-v $completeVolume:/downloads \
-v $dropfolderVolume:/watch \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 9091:9091 \
-p 51333:51333 \
--restart unless-stopped \
linuxserver/transmission
