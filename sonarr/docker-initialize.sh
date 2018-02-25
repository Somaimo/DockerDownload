#!/bin/bash

# Sonarr Bash script

uid=1001
gid=1008

app_name=sonarr
nfs_mountPoint=/srv/tiger/svcs
nfs_app=sonarr
nfs_downloadFolder=complete
nfs_seriesFolder=/srv/tiger/series
nfs_dropFolder=dropfolder

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $nfs_mountPoint/$nfs_app:/config \
-v $nfs_mountPoint/$nfs_downloadFolder/series:/downloads \
-v $nfs_seriesFolder:/tv \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 8989:8989 \
linuxserver/sonarr
