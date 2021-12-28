#!/bin/bash
INSTALLER_USER=`who am i | awk '{print $1}'`
echo "+----------<{=====x=====}>----------+"
echo "Welcome to paper-pi!"
echo "Please specify how much RAM you want to allocate to the server (e.g. 2G for 2 gigabytes, 512M for 512 megabytes)":
read MEMALLOC </dev/tty
sudo apt install -y git
git clone https://github.com/ObsidianPresidium/paper-pi
rm install.sh # remove this
cd paper-pi
wget -O "jdk.tar.gz" https://download.oracle.com/java/17/archive/jdk-17.0.1_linux-aarch64_bin.tar.gz
tar -zxvf jdk.tar.gz
rm jdk.tar.gz
wget -O "paper.jar" https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/103/downloads/paper-1.18.1-103.jar
echo "#!/bin/bash" > run.sh
echo "$PWD/jdk-17.0.1/bin/java -Xmx$MEMALLOC -Xms$MEMALLOC -jar $PWD/paper.jar nogui" >> run.sh
sudo chmod +x *
sudo chown $INSTALLER_USER *
echo "Installation finished, you should be able to use 'sh run.sh' to launch the server now!"