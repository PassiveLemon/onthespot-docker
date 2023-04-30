#!/usr/bin/env bash

if [ ! -d "/onthespot/onthespot/" ]; then
	cd /onthespot/
	pip install onthespot.whl
fi

if [ ! -e "/root/.config/casualOnTheSpot/config.json" ]; then
	cp /onthespot/config.json /root/.config/casualOnTheSpot/config.json
fi

python -m onthespot