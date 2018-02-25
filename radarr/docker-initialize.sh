#!/bin/bash

uid=1002
gid=1006

app_name=radarr
nfs_mountPoint=/srv/tiger/svcs
nfs_app=radarr
nfs_downloadFolder=complete
nfs_moviesFolder=/srv/tiger/movies
nfs_dropFolder=dropfolder

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $nfs_mountPoint/$nfs_app:/config \
-v $nfs_mountPoint/$nfs_downloadFolder/movies:/downloads \
-v $nfs_moviesFolder:/movies \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 7878:7878 \
linuxserver/radarr