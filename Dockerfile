FROM dcsunset/i3-arch-vnc

RUN pacman-key --init &&\
    pacman -Sy --noconfirm archlinux-keyring && pacman -Syu --noconfirm &&\
    pacman -S --noconfirm xorg-server wget tigervnc alacritty which i3-wm python-setuptools ttf-dejavu &&\
    pacman -S --noconfirm bash git python python-pip python-virtualenv gcc binutils alsa-lib ffmpeg &&\
    mkdir -p /root/otsdownloads

COPY entrypoint.sh /
COPY config.json /root/.config/casualOnTheSpot/
COPY config /root/.config/i3/

RUN chmod +x /entrypoint.sh
RUN chmod 777 /root/otsdownloads

# Todo: Incorporate config settings through ENV variables.

EXPOSE 5900 6080

ENTRYPOINT ["/entrypoint.sh"]