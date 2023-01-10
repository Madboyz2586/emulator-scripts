#!/bin/bash
echo "This script will install box86 and box64"
echo "Installing Box86"
sudo dpkg --add-architecture armhf
sudo wget https://itai-nelken.github.io/weekly-box86-debs/debian/box86.list -O /etc/apt/sources.list.d/box86.list
wget -qO- https://itai-nelken.github.io/weekly-box86-debs/debian/KEY.gpg | sudo apt-key add -
sudo apt update 
sudo apt install box86:armhf -y
echo "Done"

echo "Installing Box64"
sudo wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -O- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/box64-debs-archive-keyring.gpg 
sudo apt update 
sudo apt install box64 -y
echo "Done"

echo "Installing PlayOnLinux"
sudo apt update
sudo apt install playonlinux -y

echo "Installing Wine"
mkdir emulators
cd emulators
mkdir wine-install
cd wine-install
wget https://dl.winehq.org/wine-builds/debian/dists/buster/main/binary-i386/wine-stable-i386_6.0.2~buster-1_i386.deb
wget https://dl.winehq.org/wine-builds/debian/dists/buster/main/binary-i386/wine-stable_6.0.2~buster-1_i386.deb
wget https://dl.winehq.org/wine-builds/debian/dists/buster/main/binary-amd64/wine-stable-amd64_6.0.2~buster-1_amd64.deb
wget https://dl.winehq.org/wine-builds/debian/dists/buster/main/binary-amd64/wine-stable_6.0.2~buster-1_amd64.deb
dpkg-deb -xv wine-stable-i386_6.0.2~buster-1_i386.deb wine-installer
dpkg-deb -xv wine-stable_6.0.2~buster-1_i386.deb wine-installer
dpkg-deb -xv wine-stable-amd64_6.0.2~buster-1_amd64.deb wine-installer
dpkg-deb -xv wine-stable_6.0.2~buster-1_amd64.deb wine-installer
mv ~/emulator-scripts/emulators/wine-install/wine-installer/opt/wine* ~/wine
rm -rf wine-installer
cd ~/emulator-scripts/
sudo ln -s ~/wine/bin/wine /usr/local/bin/wine
sudo ln -s ~/wine/bin/wineboot /usr/local/bin/wineboot
sudo ln -s ~/wine/bin/winecfg /usr/local/bin/winecfg
sudo ln -s ~/wine/bin/wineserver /usr/local/bin/wineserver
sudo chmod +x /usr/local/bin/wine /usr/local/bin/wineboot /usr/local/bin/winecfg /usr/local/bin/wineserver
WINEPREFIX=~/.wine WINEARCH=win32 wine winecfg
WINEPREFIX=~/.wine64 WINEARCH=win64 wine winecfg
cd
cd ~/emulator-scripts/
echo "Installing winetricks"
sudo apt-get install cabextract -y
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
sudo chmod +x winetricks && sudo mv winetricks /usr/local/bin/

echo "Done"
