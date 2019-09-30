FROM lsiobase/alpine:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Somaimo"

RUN \
    echo "---- installing dependencies and packages ----" && \
    apk add --no-cache \
        curl \
        openjdk8-jre \
        python \
        unzip && \
    echo "---- installing application hydra2 ----" && \
    HYDRA_DOWNLOAD_URL=$(curl -sX GET "https://api.github.com/repos/theotherp/nzbhydra2/releases/latest" \ 
			| awk '/browser_download_url/{print $4;exit}' FS='[""]') && \
    curl -o \
    /tmp/hydra2.zip -L "${HYDRA_DOWNLOAD_URL}" && \
    mkdir -p /app/hydra2 && \
    unzip /tmp/hydra2.zip -d /app/hydra2 && \
    curl -o \
    /app/hydra2/nzbhydra2wrapper.py -L \
        "https://raw.githubusercontent.com/theotherp/nzbhydra2/master/other/wrapper/nzbhydra2wrapper.py" && \
    chmod +x /app/hydra2/nzbhydra2wrapper.py && \
    echo "---- cleaning up temp files ----" && \
    rm -rf \
        /tmp/*

# copy local files to container
COPY root/ /

# Set ports and volumes
EXPOSE 5075
VOLUME /config /downloads
