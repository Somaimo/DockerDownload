#!/usr/bin/env bash

# This script checks if the necessary volumes for streaming
# services are created before trying to run the conainters.

# The script should only be executed on hosts that will
# host the streaming containers.

numConfigVolumes=2
numMediaVolumes=1


echo "initalizing docker volumes for downloading containers."
echo "creating Config Volumes. Number of volumes: $numConfigVolumes"

# Config Volumes
for confVol in heimdall plex
do
	if docker volume ls | grep ${confVol}_config >/dev/null 2>&1 ; then
		echo "volume already exists, skipping creation"
	else
		echo "creating volume $confVol"
		docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,rw --opt device=:/mnt/lambo/container-configs/$confVol $confVol"_config"
	fi
done

# Media Volumes
for mediaVol in media_ro
do
	# separate volume name and access rights
	volName=$(echo $mediaVol | cut -f1 -d_)
	volRights=$(echo $mediaVol | cut -f2 -d_)
	if docker volume ls | grep ${volName}_${volRights} >/dev/null 2>&1 ; then
		echo "volume already exists, skipping creation"
	else
		#this is a hack for the media folder
		if [[ $volName == "media"  ]]; then
			echo "creating volume $volName with rights $volRights"
			docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,${volRights},noatime,rsize=8192,wsize=8192,tcp,timeo=14 --opt device=:/mnt/media ${volName}_${volRights}
		else
	                echo "creating volume $volName"
        	        docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,${volRights},noatime,rsize=8192,wsize=8192,tcp,timeo=14 --opt device=:/mnt/media/$volName ${volName}_${volRights}
		fi

	fi
done


