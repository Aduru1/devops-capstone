#!/usr/bin/env bash

# -------------------------------Pre-requiste----------------------------------------
# clone repo https://github.com/prhomhyse/devops-capstone
# cd into the directory devops-capstone/scripts
# sudo sh install_docker.sh [Note that this assumes you are using an Amazon EC2 Instance]


# -----------------------------Install updates----------------------------------------
apt update
apt upgrade


# -----------Install packages to allow apt to use a repository over HTTPS:-------------
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


# ----------------------Add Docker’s official GPG key:---------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# -----------------------Set up the stable repository---------------------------------
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


# ------------------------Update the apt package index--------------------------------
apt update


# -------------------Install the latest version of Docker CE--------------------------
apt-get -y install docker-ce


# ----------------------------Check docker Version -----------------------------------
# docker --version


# -------------------Give permission to user Jenkins to run dockers-------------------
# sudo usermod -a -G docker $USER
sudo usermod -a -G docker jenkins
# Restart Jenkins
systemctl restart jenkins