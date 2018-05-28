FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive

# Install full kalilinux
RUN apt-get -y update ; apt-get -y --force-yes install kali-linux-full
