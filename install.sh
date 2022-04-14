#!/bin/bash
### --- These values are custom. They can be replaced with what you desire.
MINECRAFT_SERVER_JAR="https://papermc.io/api/v2/projects/paper/versions/1.18.2/builds/283/downloads/paper-1.18.2-283.jar"
START_COMMAND="paper-pi"
PACKAGES="git openjdk-17-jre"
INSTALLED_DIALOG=false
### ---
which ls >> /dev/null
which dialog >> /dev/null
if $?==1
then
    sudo apt install -y dialog
    INSTALLED_DIALOG=true
fi

dialog --yesno \
"Welcome to the paper-pi installation! This script will \
install a Minecraft server to the folder ~/paper-pi, \
this will install these packages: $PACKAGES
do you want to continue?" 10 80
if $?==1
then
    echo "User abort"
    if $INSTALLED_DIALOG==true
    then
        echo "Cleaning up..."
        sudo apt remove -y dialog
    fi
    exit
fi

dialog --inputbox \
"Please specify how much RAM you want \
to allocate to the server (e.g. 2G for 2 gigabytes, \
512M for 512 megabytes)" 20 80 2> /tmp/paper-pi-memAlloc
memAlloc="$(cat /tmp/paper-pi-memAlloc)"
rm /tmp/paper-pi-memAlloc

git clone https://github.com/ObsidianPresidium/paper-pi.git
sudo apt install -y git openjdk-17-jre dialog
cd paper-pi
rm install.sh # remove myself
wget -O "paper.jar" $MINECRAFT_SERVER_JAR
echo "Exec=java -Xmx$memAlloc -Xms$memAlloc -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar $PWD/paper.jar" >> "Start PaperMC Minecraft Server.desktop"
cp "Start PaperMC Minecraft Server.desktop" ~/Desktop/"Start PaperMC Minecraft Server.desktop"
clear
echo "Installation finished, you should be able to use the shortcut to launch the server now!"