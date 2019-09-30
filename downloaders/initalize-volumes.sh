#!/usr/bin/env bash

# This script checks if the necessary volumes for downloading
# services are created before trying to run the conainters.

# The script should only be executed on hosts that will
# host the downloading containers.

numConfigVolumes=5
numMediaVolumes=3


echo "initalizing docker volumes for downloading containers."
echo "creating Config Volumes. Number of volumes: $numConfigVolume"

# Config Volumes
for confVol in heimdall radarr sonarr sabnzbd transmission
do
	if docker volume ls | grep ${confVol}_config >/dev/null 2>&1 ; then
		echo "volume already exists, skipping creation"
	else
		echo "creating volume $confVol"
		docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,rw --opt device=:/mnt/lambo/container-configs/$confVol $confVol"_config"
	fi
done

# Media Volumes
for mediaVol in movies_rw series_rw complete_rw incomplete-sabnzbd_rw dropfolder-transmission_rw dropfolder-nzbhydra_rw
do
	# separate volume name and access rights
	volName=$(echo $mediaVol | cut -f1 -d_)
	volRights=$(echo $mediaVol | cut -f2 -d_)
	if docker volume ls | grep ${volName}_${volRights} >/dev/null 2>&1 ; then
		echo "volume already exists, skipping creation"
	else
		if [[ $volName =~ "-" ]]; then
			volPath=$(echo $volName | cut -f1 -d-)/$(echo $volName | cut -f2 -d-)
		else
			volPath=$volName
		fi
		echo "creating volume $volName"
		docker volume create --driver local --opt type=nfs --opt o=nfsvers=4,addr=10.20.1.10,${volRights},rsize=8192,wsize=8192,tcp,timeo=14 --opt device=:/mnt/media/$volPath ${volName}_${volRights}
	fi
done


