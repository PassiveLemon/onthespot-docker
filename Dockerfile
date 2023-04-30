FROM archlinux:latest

RUN pacman -Syuu --noconfirm &&\
    pacman -S --noconfirm xorg-xauth libxcb qt5-base python-pyqt5 &&\
    pacman -S --noconfirm bash git python python-pip python-virtualenv gcc binutils alsa-lib ffmpeg &&\
    mkdir -p /onthespot/downloads/

COPY entrypoint.sh /onthespot/
COPY config.json /onthespot/

RUN chmod +x /onthespot/entrypoint.sh
RUN chmod -R 777 /onthespot/downloads/

# Todo: Incorporate config settings through ENV variables.
ENV DISPLAY $DISPLAY

ENTRYPOINT ["/onthespot/entrypoint.sh"]