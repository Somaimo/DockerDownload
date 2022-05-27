#!/bin/bash

echo Checking if  checking if ubiquiti file paths are available
UISP_BASE="/data/uisp"
[[ -d "$UISP_BASE" ]] || mkdir -p "$UISP_BASE" || { echo "Couldn't create storage directory: $UISP_BASE"; exit 1; }

echo starting ubiquiti docker-compose

docker-compose -f ./docker-compose.yaml up -d

