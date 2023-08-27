#!/usr/bin/env bash
set -ex

apt-get update
apt-get install -y libxkbcommon-x11-0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-xinerama0 libxcb-xfixes0 libegl1-mesa
apt-get install -y git python3 python3-pip python3-venv ffmpeg

mkdir -p /opt/onthespot/
mkdir -p /home/kasm-user/Downloads/OnTheSpot/

cd /opt/onthespot/
git clone --branch main https://github.com/casualsnek/onthespot
cd ./onthespot/
chmod +x ./build_linux.sh
bash ./build_linux.sh
chmod +x ./dist/onthespot_linux

echo "[Desktop Entry]
Name=OnTheSpot
Exec=/opt/onthespot/onthespot/dist/onthespot_linux
Icon=/opt/onthespot/onthespot/src/onthespot/resources/icon.png
Type=Application
Categories=Utility;" > /usr/share/applications/onthespot.desktop

cp /usr/share/applications/onthespot.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/onthespot.desktop

# Cleanup
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi
