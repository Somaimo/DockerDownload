#!/bin/bash

uid=1002
gid=1006

app_name=transmission
nfs_mountPoint=/srv/tiger/svcs
nfs_app=transmission
nfs_downloadFolder=complete
nfs_dropFolder=dropfolder
nfs_mediaMountPoint=/srv/tiger/media

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $nfs_mountPoint/$nfs_app:/config \
-v $nfs_mediaMountPoint/complete:/downloads \
-v $nfs_mountPoint/$nfs_dropFolder:/watch \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 9091:9091 \
-p 51333:51333 \
linuxserver/transmission
