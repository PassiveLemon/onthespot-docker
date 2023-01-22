# onthespot-docker </br>

[![Repo](https://img.shields.io/badge/Docker-Repo-007EC6?labelColor-555555&color-007EC6&logo=docker&logoColor=fff&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Version](https://img.shields.io/docker/v/passivelemon/onthespot-docker/latest?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Size](https://img.shields.io/docker/image-size/passivelemon/onthespot-docker/latest?sort=semver&labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Pulls](https://img.shields.io/docker/pulls/passivelemon/onthespot-docker?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)

Docker container for [OnTheSpot](https://github.com/casualsnek/onthespot). </br>
Arch VNC container provided by [DCsunset](https://github.com/DCsunset/docker-i3-arch-vnc). </br>

#### STILL A WIP </br>

If your distribution does not easily support building with python (ex: NixOS), or you just want a portable but separate OTS, this is the Docker container for you. </br>

## Docker Container </br>
Run it: </br>
```
docker run -d --name <name> -p 5900:5900 -p 6080:6080 -v <host download dir>:/root/otsdownloads/ -e VNC_PASSWD=<password> passivelemon/onthespot-docker:latest
```
#### Example: </br>
```
docker run -d --name OnTheSpotDocker -p 5900:5900 -p 6080:6080 -v /home/lemon/Downloads/OnTheSpotDocker/:/root/otsdownloads/ -e VNC_PASSWD=123 passivelemon/onthespot-docker:latest
```

### Container Options </br>
Set `<name>` to whatever you want. </br>
Set `<host download dir>` to the location that you want OTS to download songs to. </br>
Set `<password>` to the password you want to use. This MUST be set or it will not work. </br>
You can even mount `/root/.config/casualOnTheSpot/` to a host directory to maintain the config file between rebuilds. </br>

# Usage </br>
Once it is run, it will build OTS and setup the VNC. This may take a few minutes. </br>
1. Head to http://localhost:6080/ to access the VNC. If the container hasn't finished setting up, nothing will show. </br>
2. Enter the password you set earlier to enter. </br>
3. You will need to go to the config tab and enter your Spotify account details. OTS should be started automatically. If it isn't, open OTS using `alt+shift+p` </br>
   - If the window size is too weird, you can modify it by right clicking and dragging the space between the terminal and OTS. </br>
4. Once you enter your account details, close OTS with `alt+shift+q`. This is required. </br>
5. Open OTS back up using `alt+shift+p`. </br>
6. Use OTS! </br>
   - The download directory is set by default. Assuming you mounted a host directory correctly, it will download to there. </br>

# Other </br>
Go to [OnTheSpot](https://github.com/casualsnek/onthespot) for extra details on usage. </br>

I'll try to reduce the size of the image but xorg is such a large package, it probably cant be changed by much. </br>

If OTS ever gets scripting support, I will determine if it is necessary to futher develop this. </br>

## Todo
- Allow customization of config upon startup with environment variables. </br>
