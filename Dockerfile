FROM dcsunset/i3-arch-vnc

RUN pacman-key --init &&\
    pacman -Sy --noconfirm archlinux-keyring && pacman -Syu --noconfirm &&\
    pacman -S --noconfirm nano bash curl git p7zip python python-pip python-virtualenv gcc binutils alsa-lib ffmpeg &&\
    mkdir -p /root/otsdownloads

COPY entrypoint.sh /
COPY config.json /root/.config/casualOnTheSpot/

RUN chmod +x /entrypoint.sh
RUN chmod 777 /root/otsdownloads

# Todo: Incorporate password settings + any other necessary commands

EXPOSE 5900

ENTRYPOINT ["/entrypoint.sh"]