# paper-pi
An easy-to-use Paper Minecraft server installation script.
Downloads OpenJDK 17 and a recent PaperMC Spigot server jarfile, and creates an environment for them to run.

This script assumes you agree to Minecraft's EULA, and that you are running Debian, or some variant of it, like Raspbian.

---
## Usage
Make sure you have at least ~500MB of space available.
This script downloads all the files into a folder called paper-pi, which will be made in the present working directory.
1. Open a terminal or SSH into your Raspberry Pi.
2. (optional) Change the directory to where you'd like your server to run from.
3. Copy-paste this command into the terminal, and run it:

`curl -sSL https://raw.githubusercontent.com/ObsidianPresidium/paper-pi/main/install.sh | bash`

4. Specify how much memory you want to allocate to the server.

A good rule of thumb (assuming you're running Raspbian) is to leave 512MB of memory free to use for the OS. Below you can see what I would recommend you should run depending on your model.

| Model | Memory to allocate|
| ----------- | ----------- |
| Raspberry Pi 1/2/3A(+) Zero/Zero2 | [Any amount by using a swap file of equal size](https://github.com/ObsidianPresidium/paper-pi/wiki/Old-Raspberry-Pi-models) |
| Raspberry Pi 3B(+) | `512M` |
| Raspberry Pi 4 2GB | `1536M` |
| Raspberry Pi 4/5 4GB | `3584M` |
| Raspberry Pi 4/5 8GB | `7680M` |
| Rapsberry Pi 400 | `3584M` |

(Pis with less than 1GB is NOT recommended)

5. Run the server by executing `paper-pi` in console!
