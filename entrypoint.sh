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

/onthespot/onthespot/dist/onthespot_linux