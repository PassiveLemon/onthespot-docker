FROM archlinux:latest

RUN pacman -Syuu --noconfirm &&\
    pacman -S --noconfirm xorg-xauth libxcb qt5-base &&\
    pacman -S --noconfirm bash git python python-pip python-virtualenv gcc binutils alsa-lib ffmpeg &&\
    mkdir -p /onthespot/downloads/

COPY entrypoint.sh /onthespot/
COPY config.json /onthespot/
COPY config /root/.config/i3/

RUN chmod +x /onthespot/entrypoint.sh
RUN chmod -R 777 /onthespot/downloads/

# Todo: Incorporate config settings through ENV variables.
ENV BRANCH=development
ENV DISPLAY $DISPLAY
ENV QT_DEBUG_PLUGINS=1

ENTRYPOINT ["/onthespot/entrypoint.sh"]