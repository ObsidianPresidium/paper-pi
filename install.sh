#!/bin/bash
sudo apt install -y git
git clone https://github.com/ObsidianPresidium/paper-pi
cd paper-pi
wget -O "jdk.tar.gz" https://download.oracle.com/java/17/archive/jdk-17.0.1_linux-aarch64_bin.tar.gz
tar -zxvf jdk.tar.gz
rm jdk.tar.gz
wget -O "paper.jar" https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/103/downloads/paper-1.18.1-103.jar
sudo chmod +x *
echo Done
