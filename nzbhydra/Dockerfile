FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Nomaimo"

# Python should use utf8 instead of ascii
ENV PYTHONENCODING="UTF-8"

RUN echo "---- installing app ---" && \
         git clone --depth 1 https://github.com/theotherp/nzbhydra /app/hydra

# copy required local files
COPY root/ /

# Expose NZBHydra Port and Volumes
EXPOSE 5075
#VOLUME /config /downloads