#!/bin/bash

uid=1002
gid=1006

app_name=sabnzbd
nfs_mountPoint=/srv/tiger/svcs
nfs_app=sab-new
nfs_mountMediaPoint=/srv/tiger
nfs_downloadFolder=complete
nfs_incompleteFolder=incomplete

echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $nfs_mountPoint/$nfs_app:/config \
-v $nfs_mountMediaPoint/movies:/downloads/movies \
-v $nfs_mountMediaPoint/series:/downloads/series \
-v $nfs_mountPoint/$nfs_incompleteFolder:/incomplete-downloads \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 8080:8080 \
sabnzbdplus