#!/bin/bash
sudo apt install -y git
git clone https://github.com/ObsidianPresidium/paper-pi
cd paper-pi
curl -o https://download.oracle.com/java/17/archive/jdk-17.0.1_linux-aarch64_bin.tar.gz
tar -zxvf jdk-17.0.1_linux-aarch64_bin.tar.gz
rm jdk-17.0.1_linux-aarch64_bin.tar.gz
curl -o https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/103/downloads/paper-1.18.1-103.jar
mv paper-1.18.1-103.jar paper.jar
sudo chmod +x *
echo Done