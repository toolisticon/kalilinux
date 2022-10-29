FROM docker.io/kalilinux/kali-rolling:latest

LABEL authors="Martin Reinhardt <martin@m13t.de>"
LABEL vendor="Holisticon AG"

ENV DEBIAN_FRONTEND noninteractive

# Fix GPG errors, see https://superuser.com/questions/1644520/apt-get-update-issue-in-kali
RUN apt -o Acquire::AllowInsecureRepositories=true -o Acquire::AllowDowngradeToInsecureRepositories=true update && apt-get -y install wget &&\
  wget http://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb &&\
  dpkg -i kali-archive-keyring_2022.1_all.deb && rm kali-archive-keyring_2022.1_all.deb

# Install full kalilinux
RUN apt-get -y update && apt-get -y upgrade &&\
  apt-get -y install kali-linux-everything libwine man-db exploitdb curl &&\
  apt-get autoremove -y && apt-get -y clean && rm -rf /var/lib/apt/lists/*
