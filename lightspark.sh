#!/bin/bash
mkdir emulators
cd emulators
echo "Installing Dependencies"
sudo apt install git gcc g++ nasm cmake libcurl4-gnutls-dev libsdl2-mixer-dev libsdl2-dev libpango1.0-dev libcairo2-dev libavcodec-dev libswresample-dev libglew-dev librtmp-dev libjpeg-dev libavformat-dev liblzma-dev
git clone https://github.com/lightspark/lightspark.git
echo "Compiling"
cd lightspark
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc)
sudo make install
echo "Done"
