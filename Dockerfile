#FROM archlinux:latest
FROM dcsunset/i3-arch-vnc

#RUN pacman -Syu --noconfirm &&\
#    pacman -S --noconfirm bash xorg-server tigervnc curl git p7zip python python-pip python-virtualenv

RUN pacman -Sy --noconfirm archlinux-keyring && pacman -Syu --noconfirm

RUN pacman -S --noconfirm bash curl git p7zip python python-pip python-virtualenv

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

# Incorporate password settings + any other necessary commands

EXPOSE 5900

ENTRYPOINT ["/entrypoint.sh"]