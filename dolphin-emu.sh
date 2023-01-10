#!/bin/bash
mkdir emulators
cd emulators
git clone https://github.com/dolphin-emu/dolphin.git
cd dolphin
git submodule update --init
mkdir build
cd build
cmake ..
make -j $(nproc)
sudo make install
cd ~/emulator-scripts/emulators
