#!/usr/bin/env bash

cd /opt/
mkdir -p ./downloads

# Option 1 (Building)
#git clone https://github.com/casualsnek/onthespot
#curl -L --output ./ffmpeg-release-full.7z https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z
#7z x ffmpeg-release-full.7z
#mkdir -p ./onthespot/ffbin_nix/
#cp -r ffmpeg-*-full_build/bin/* ./onthespot/ffbin_nix/
#cd onthespot
#bash ./build_linux.sh
#echo "./opt/onthespot/dist/onthespot_linux" > ~/.xinitrc && chmod +x ~/.xinitrc

# Option 2 (Downloading)
curl -L --output ./onthespot_linux https://github.com/casualsnek/onthespot/releases/latest/download/onthespot_linux
chmod +x ./onthespot_linux
echo "./opt/onthespot_linux" > ~/.xinitrc && chmod +x ~/.xinitrc

x11vnc -create -forever &
wait