FROM kalilinux/kali-linux-docker

LABEL authors="Martin Reinhardt <martin.reinhardt@holisticon.de>"
LABEL vendor="Holisticon AG"

ENV DEBIAN_FRONTEND noninteractive

# Install full kalilinux
RUN apt-get -y update ; apt-get -y --force-yes install kali-linux-full &&\
  rm -rf /var/lib/apt/lists/*
