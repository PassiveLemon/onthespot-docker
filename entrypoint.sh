#!/usr/bin/env bash

set -e

# Install apps
pacman -Syu --noconfirm xorg-server \
	wget tigervnc alacritty which \
	i3-wm python-setuptools ttf-dejavu

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

cd /root

git clone https://github.com/casualsnek/onthespot
cd onthespot
bash ./build_linux.sh
chmod +x /root/onthespot/dist/onthespot_linux

[[ -f /scripts/init.sh ]] && /scripts/init.sh && rm /scripts/init.sh

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
	exec /root/onthespot/dist/onthespot_linux
else
	# prevent process from exiting
	tail -f /dev/null
fi

wait