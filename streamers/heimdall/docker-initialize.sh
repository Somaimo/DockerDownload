#!/bin/bash

uid=1005
gid=1017

app_name=heimdall
docker_Volume=heimdall_config
#nfs_app=heimdall
#nfs_configMountPoint=/srv/panther/configs

# creating volume (if it not already exists)
if docker volume ls | grep $docker_Volume >/dev/null 2>&1  ; then
	echo "volume already exists, skipping creation"
else
	docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,rw --opt device=:/mnt/lambo/container-configs/$app_name $docker_Volume
fi


# Variant with volume
echo "starting ${app_name} with correct env options"
docker run -d --name=$app_name \
-v $docker_Volume:/config \
-e PGID=$gid -e PUID=$uid \
-e TZ=Europe/Zurich \
-p 80:80 \
-p 443:443 \
--restart unless-stopped \
linuxserver/heimdall

#Variant with bind mount
#echo "starting ${app_name} with correct env options"
#docker run -d --name=$app_name \
#-v $nfs_configMountPoint/$nfs_app:/config \
#-e PGID=$gid -e PUID=$uid \
#-e TZ=Europe/Zurich \
#-p 80:80 \
#-p 443:443 \
#--restart unless-stopped \
#linuxserver/heimdall

