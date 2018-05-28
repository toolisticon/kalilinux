FROM kalilinux/kali-linux-docker

LABEL authors="Martin Reinhardt <martin.reinhardt@holisticon.de>"

ENV DEBIAN_FRONTEND noninteractive

# Install full kalilinux
RUN apt-get -y update ; apt-get -y --force-yes install kali-linux-full
