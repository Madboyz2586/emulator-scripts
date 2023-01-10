#!/bin/bash
echo "Installing Citra"
mkdir emulators
cd emulators
echo "installing dependencies"
sudo apt install git libsdl2-2.0-0 libsdl2-dev qtbase5-dev libqt5opengl5-dev qtmultimedia5-dev libqt5multimedia5-plugins libfdk-aac-dev ffmpeg libavcodec58 build-essential libc++-dev cmake clang
git clone --recursive https://github.com/citra-emu/citra
cd citra
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_FFMPEG=ON ..
cmake --build . -- -j"$(nproc)"
echo "Test Emulator if it dosen't open or work cancel the script"
cd bin
./citra-qt
echo "Continuing"
cd ..
sudo make install
echo "Installed Citra"
