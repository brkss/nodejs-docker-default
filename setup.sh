#!/bin/bash

# uninstall old versions 
sudo apt-get remove docker docker-engine docker.io containerd runc

# updates
sudo apt-get update && sudo apt-get upgrade -y

# Setup repositry

# allow apt to use repos over https
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add Docker GPG Key !
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Setup the stable repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update apt packages
sudo apt-get update

# install docker ! 
sudo apt-get install docker-ce docker-ce-cli containerd.io

# create non-root user and add it to docker group !
adduser userdo
usermod -aG docker userdo

# restart docker 
systemctl restart docker

# test docker 
docker run hello-world

# enable docker to run when system boots
systemctl enable docker
