#!/usr/bin/env bash

# Most of this was taken from https://github.com/DCsunset/docker-i3-arch-vnc/tree/master/scripts. It is modified to fit this need.

set -e

# Install noVNC
if [ "$DISABLE_NOVNC" != "true" ]; then
	export noVNC_version=1.2.0
	export websockify_version=0.10.0

	wget https://github.com/novnc/websockify/archive/v${websockify_version}.tar.gz -O /websockify.tar.gz \
		&& tar -xvf /websockify.tar.gz -C / \
		&& cd /websockify-${websockify_version} \
		&& python setup.py install \
		&& cd / && rm -r /websockify.tar.gz /websockify-${websockify_version} \
		&& wget https://github.com/novnc/noVNC/archive/v${noVNC_version}.tar.gz -O /noVNC.tar.gz \
		&& tar -xvf /noVNC.tar.gz -C / \
		&& mv /noVNC-${noVNC_version} /noVNC \
		&& cd /noVNC \
		&& ln -s vnc.html index.html \
		&& rm /noVNC.tar.gz
fi

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

# current user
CUSER=${USERNAME:-root}
# add user if specified
if [ ! -z $USERNAME ]; then
	HOMEDIR="/home/$USERNAME"
	# Check if user exists
	if ! id "$USERNAME" &> /dev/null; then
		pacman -S --noconfirm sudo
		useradd -m -G wheel $USERNAME
		# delete password
		passwd -d $USERNAME
		echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
	fi
else
	HOMEDIR="/root"
fi

umask 0077                # use safe default permissions
mkdir -p "$HOMEDIR/.vnc"
chmod go-rwx "$HOMEDIR/.vnc" # enforce safe permissions

# Start TigerVNC
if [ ! -z $VNC_PASSWD ]; then
	vncpasswd -f <<< "$VNC_PASSWD" > "$HOMEDIR/.vnc/passwd"
fi

chown -R $CUSER:$CUSER "$HOMEDIR"
# Remove lock since stopping containers won't remove it
rm -f /tmp/.X0-lock

echo Starting vncsession...
vncsession $CUSER :0

# Start noVNC
if [ "$DISABLE_NOVNC" != "true" ]; then
	/noVNC/utils/launch.sh
else
	# prevent process from exiting
	tail -f /dev/null
fi

wait