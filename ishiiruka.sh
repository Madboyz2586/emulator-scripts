#!/bin/bash
sudo apt install cmake pkg-config git libao-dev libasound2-dev libavcodec-dev libavformat-dev libbluetooth-dev libenet-dev libgtk2.0-dev liblzo2-dev libminiupnpc-dev libopenal-dev libpulse-dev libreadline-dev libsfml-dev libsoil-dev libsoundtouch-dev libswscale-dev libusb-1.0-0-dev libwxbase3.0-dev libwxgtk3.0-dev libxext-dev libxrandr-dev portaudio19-dev zlib1g-dev libudev-dev libevdev-dev libmbedtls-dev libcurl4-openssl-dev libegl1-mesa-dev libpng-dev qtbase5-private-dev
git clone --branch Stable https://github.com/Tinob/Ishiiruka.git
cd Ishiiruka
git submodule update --init
mkdir build
cd build
cmake ..
sudo make -j$(nproc)
sudo make install
