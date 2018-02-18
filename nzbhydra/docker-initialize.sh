#!/bin/bash

uid=1002
gid=1006

app_name=hydra2
nfs_mountPoint=/srv/tiger/svcs
nfs_app=nzbhydra
nfs_dropFolder=dropfolder

echo "starting nzb hydra with correct env options"
docker run -d --name=$app_name \
-v $nfs_mountPoint/$nfs_app:/config \
-v $nfs_mountPoint/$nfs_dropFolder:/downloads \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 5075:5075 \
nzbhydra