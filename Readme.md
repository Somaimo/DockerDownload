# Downloaders @ Dockers

Initial release, this Repository holds all the Download and Streaming Daemons - all dockerized and stuff.

In each subfolder there is a script to initailize the required docker volumes (we don't want to use local bind mounts so as not to be dependent on host specific mounts (except the transcode folder for plex for hopefully obvious reasons).

## Folder downloaders
In this folder all specific containers for the download host are stored.

## Folder streamers
In this folder all specific containers for the stream hosts are stored (including heimdall).


# TODO
- [ ] Add new volume creation script for admin containers.
- [x] Refactor volume creation (should be one script that creates the volume). Deployscripts just check if volume is available.
- [x] Separate Media tools from download tools.
