# paper-pi
An easy-to-use Paper Minecraft server installation script.
Downloads Oracle's JDK 17 and a recent PaperMC Spigot server jarfile, and creates an environment for them to run.

This script assumes you agree to Minecraft's EULA, and that you are running Debian, or some variant of it, like Raspbian.

---
## Usage
Make sure you have at least ~500 megs of space available.
This script downloads all the files into a folder called paper-pi, which will be made in the present working directory.
1. Open a terminal or SSH into your Raspberry Pi.
2. (optional) Change the directory to where you'd like your server to run from.
3. Copy-paste this command into the terminal, and run it:

`curl -sSL install link | sudo bash`

4. Run the server with `sh run_*_RAM.sh`, with * being either `512MB` or `1GB` or `2GB`, depending on how much memory you wish to allocate to the server.

A good rule of thumb (assuming you're running Raspbian) is to leave 500 megs of memory free to use for the OS. Below you can see what I would recommend you should run depending on your model.

| Model | Command to run |
| ----------- | ----------- |
| Raspberry Pi <= 3 A+ | [Not recommended](https://github.com/ObsidianPresidium/paper-pi/wiki/Unsupported-Raspberry-Pi-models) |
| Raspberry Pi 3 B or B+ | `sh run_512MB_RAM.sh` |
| Raspberry Pi 4 2GB | `sh run_1GB_RAM.sh` |
| Raspberry Pi 4 4GB | `sh run_2GB_RAM.sh` |
| Raspberry Pi 4 8GB | `sh run_2GB_RAM.sh` |
| Rapsberry Pi 400 | `sh run_2GB_RAM.sh` |


