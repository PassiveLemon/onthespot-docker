# onthespot-docker </br>

[![Repo](https://img.shields.io/badge/Docker-Repo-007EC6?labelColor-555555&color-007EC6&logo=docker&logoColor=fff&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Version](https://img.shields.io/docker/v/passivelemon/onthespot-docker/latest?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Size](https://img.shields.io/docker/image-size/passivelemon/onthespot-docker/latest?sort=semver&labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Pulls](https://img.shields.io/docker/pulls/passivelemon/onthespot-docker?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)

Docker container for [OnTheSpot](https://github.com/casualsnek/onthespot). </br>
Arch VNC container provided by [DCsunset](https://github.com/DCsunset/docker-i3-arch-vnc). </br>

If your distribution does not easily support building with python (ex: NixOS), or you just want a portable but separate OTS, this is the Docker container for you. </br>

## Docker Container </br>
Run it: </br>
```
docker run -d --name (container name) -p 5900:5900 -p 6080:6080 -v (host download dir):/root/otsdownloads/ -e VNC_PASSWD=(password) passivelemon/onthespot-docker:latest
```
| Operator | Need | Details |
|:-|:-|:-|
| `-d` | No | Will run the container in the background. I recommend having it for simplicity. |
| `--name (container name)` | No | Sets the name of the container to the following word. You can change this to whatever you want. |
| `-p 5900:5900` `-p 6080:6080` | Yes | 5900 is for a VNC client and 6080 is for the web browser VNC. At least one of them is needed but not both. |
| `(host download dir):/root/otsdownloads/` | Yes | Sets the host location that you want OTS to download songs to. |
| `(host config dir):/root/.config/casualOnTheSpot/` | No | Mount the config file directory to stay between rebuilds. |
| `VNC_PASSWD=(password)` | Yes | Sets the password you want to use. This MUST be set or it will not work. |
| `passivelemon/onthespot-docker:latest` | Yes | The repository on Docker hub. By default, it is the latest version that I have published. |

#### Example: </br>
```
docker run -d --name OnTheSpotDocker -p 5900:5900 -p 6080:6080 -v /home/lemon/Downloads/OnTheSpotDocker/:/root/otsdownloads/ -e VNC_PASSWD=123 passivelemon/onthespot-docker:latest
```

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
- Note that you cannot copy and paste when using the web browser VNC.

# Other </br>
Go to [OnTheSpot](https://github.com/casualsnek/onthespot) for extra details on usage. </br>

You can also use a VNC like TigerVNC to get in as well. The web interface is the most accessible so that's what will be supported. </br>

If OTS ever gets scripting support, I will determine if it is necessary to futher develop this. </br>
