#!/usr/bin/env bash

if [ ! -d "/onthespot/onthespot/" ]; then
	cd /onthespot/
	git clone --branch ${BRANCH} https://github.com/casualsnek/onthespot
	cd /onthespot/onthespot/
	chmod 777 /onthespot/onthespot/build_linux.sh
	bash /onthespot/onthespot/build_linux.sh
	chmod +x /onthespot/onthespot/dist/onthespot_linux
fi

if [ ! -e "/root/.config/casualOnTheSpot/config.json" ]; then
	cp /onthespot/config.json /root/.config/casualOnTheSpot/config.json
fi

export WLR_BACKENDS=headless
export WLR_LIBINPUT_NO_DEVICES=1

chmod a+s /usr/sbin/sway
exec sway

export WAYLAND_DISPLAY=wayland-1
export XDG_RUNTIME_DIR=/tmp/whatever
mkdir -p "$XDG_RUNTIME_DIR"

wait