FROM registry.gitlab.com/kalilinux/build-scripts/kali-docker/kali:latest

LABEL authors="Martin Reinhardt <martin.reinhardt@holisticon.de>"
LABEL vendor="Holisticon AG"

ENV DEBIAN_FRONTEND noninteractive

# Install full kalilinux
RUN apt-get -y update && apt-get -y upgrade &&\
  apt-get -y install kali-linux-everything libwine man-db exploitdb &&\
  apt-get autoremove -y && apt-get -y clean && rm -rf /var/lib/apt/lists/*
