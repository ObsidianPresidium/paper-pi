#!/bin/bash
### --- These values are custom. They can be replaced with what you desire.
MINECRAFT_SERVER_JAR="https://papermc.io/api/v2/projects/paper/versions/1.18.2/builds/283/downloads/paper-1.18.2-283.jar"
START_COMMAND="paper-pi"
PACKAGES="git openjdk-17-jre"
### ---

echo "+----------<{=====x=====}>----------+"
echo "Welcome to the paper-pi installation!"
echo "Please specify how much RAM you want to allocate to the server (e.g. 2G for 2 gigabytes, 512M for 512 megabytes)":
INSTALLER_USER=`who am i | cut -d " " -f 1`
read MEMALLOC </dev/tty
echo "Please confirm that you want to install paper-pi. This will install these packages: $PACKAGES"
read
sudo apt install -y git openjdk-17-jre
git clone https://github.com/ObsidianPresidium/paper-pi.git
cd paper-pi
rm install.sh # remove myself
wget -O "paper.jar" $MINECRAFT_SERVER_JAR
echo "alias $START_COMMAND=java -Xmx$MEMALLOC -Xms$MEMALLOC -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar $PWD/paper.jar nogui" >> ~/.bashrc
sudo chown -R $INSTALLER_USER *
echo "Installation finished, you should be able to use the shortcut to launch the server now! (you can also start the server manually by using the paper-pi command in a terminal window)"