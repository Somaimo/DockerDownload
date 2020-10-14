#!/bin/bash

echo Checking if pi-hole paths are available
PIHOLE_BASE="/data/pihole"
[[ -d "$PIHOLE_BASE" ]] || mkdir -p "$PIHOLE_BASE" || { echo "Couldn't create storage directory: $PIHOLE_BASE"; exit 1; }

echo starting pi-hole docker-compose

docker-compose -f ./docker-compose.yaml up -d

