FROM ubuntu:22.04

RUN apt update &&\
    apt upgrade &&\
    DEBIAN_FRONTEND=noninteractive apt install -y xvfb x11vnc curl git p7zip-full python-is-python3 python3-pip python3.10-venv

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

# Incorporate password settings + any other necessary commands

EXPOSE 5900

ENTRYPOINT ["/entrypoint.sh"]