FROM linuxserver/sabnzbd

RUN \
    echo "***** Creating Directories for media library *****" && \
    mkdir /downloads/movies  && \
    mkdir /downloads/series && \
    echo "***** All done *****"

# Add additional volumes
VOLUME /downloads/movies /downloads/series