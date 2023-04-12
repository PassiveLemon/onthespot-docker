FROM archlinux:latest

RUN pacman -Syuu --noconfirm &&\
    pacman -S --noconfirm xorg-server wget tigervnc alacritty which i3-wm python-setuptools ttf-dejavu &&\
    pacman -S --noconfirm bash git python python-pip python-virtualenv gcc binutils alsa-lib ffmpeg &&\
    mkdir -p /onthespot/downloads/

COPY entrypoint.sh /onthespot/
COPY config.json /onthespot/
COPY config /root/.config/i3/

RUN chmod +x /onthespot/entrypoint.sh
RUN chmod -R 777 /onthespot/downloads/

# Todo: Incorporate config settings through ENV variables.
ENV BRANCH=main

EXPOSE 5900 6080

ENTRYPOINT ["/onthespot/entrypoint.sh"]