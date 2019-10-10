#!/bin/bash

uid=1005
gid=1017

app_name=hydra2
confVolume=nzbhydra_config
dropfolderVolume=dropfolder-nzbhydra_rw

echo "starting nzb hydra with correct env options"
docker run -d --name=$app_name \
-v $confVolume:/config \
-v $dropfolderVolume:/downloads \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 5075:5075 \
--restart unless-stopped \
linuxserver/hydra2
