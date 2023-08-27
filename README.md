# [onthespot-docker](https://github.com/PassiveLemon/onthespot-docker) </br>

[![Repo](https://img.shields.io/badge/Docker-Repo-007EC6?labelColor-555555&color-007EC6&logo=docker&logoColor=fff&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Version](https://img.shields.io/docker/v/passivelemon/onthespot-docker/latest?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Size](https://img.shields.io/docker/image-size/passivelemon/onthespot-docker/latest?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)
[![Pulls](https://img.shields.io/docker/pulls/passivelemon/onthespot-docker?labelColor-555555&color-007EC6&style=flat-square)](https://hub.docker.com/r/passivelemon/onthespot-docker)

Docker container for [OnTheSpot](https://github.com/casualsnek/onthespot). </br>

# Current
OTS should have CLI support in upcoming updates. While I do not know when this will happen, this container will not be updated until then, after which it will be completely redone. </br>

### Docker run </br>
```
docker run -d --name (container name) -p 6901:6901 -v (host download dir):/home/kasm-user/Downloads/OnTheSpot/ -v (host config file):/home/kasm-user/.config/casualOnTheSpot/config.json` -e VNC_PW:(password) passivelemon/onthespot-docker:latest
```

### Docker Compose </br>
```yml
version: '3.3'
services:
   onthespot-docker:
      image: passivelemon/onthespot-docker:latest
      container_name: onthespot-docker
      ports:
         - 6901:6901/tcp
      volumes:
         - (host download dir):/home/kasm-user/Downloads/OnTheSpot/
         - (host config file):/home/kasm-user/.config/casualOnTheSpot/config.json
      environment:
         VNC_PW: '(password)'
```

| Operator | Need | Details |
|:-|:-|:-|
| `-d` | No | Will run the container in the background. I recommend having it for simplicity. |
| `--name (container name)` | No | Sets the name of the container to the following word. You can change this to whatever you want. |
| `-p 6901:6901` | Yes | Sets the port to access the Kasm VNC server. |
| `-v (host download dir):/home/kasm-user/Downloads/OnTheSpot/` | Yes | Sets the host location that you want OTS to download songs to. |
| `-v (host config file):/home/kasm-user/.config/casualOnTheSpot/config.json` | No | Mount the config.json file to stay between rebuilds. |
| `-e VNC_PW:(password)` | Recommended | Sets the password for the VNC UI. By default, it is `password` |
| `passivelemon/onthespot-docker:latest` | Yes | The repository on Docker hub. By default, it is the latest version that I have published. |

## Example </br>
### Docker run </br>
```
docker run -d --name OnTheSpotDocker -v /home/lemon/Downloads/OnTheSpotDocker/:/home/kasm-user/Downloads/OnTheSpot/ -v /home/lemon/Downloads/OnTheSpotDocker/config.json:/home/kasm-user/.config/casualOnTheSpot/config.json -e VNC_PW:'password123' passivelemon/onthespot-docker:latest
```

### Docker Compose </br>
```yml
version: '3.3'
services:
   onthespot-docker:
      image: passivelemon/onthespot-docker:latest
      container_name: onthespot-docker
      ports:
         - 6901:6901/tcp
      volumes:
         - /home/lemon/Downloads/OnTheSpotDocker/:/home/kasm-user/Downloads/OnTheSpot/
         - /home/lemon/Downloads/OnTheSpotDocker/config.json:/home/kasm-user/.config/casualOnTheSpot/config.json
      environment:
         VNC_PW: 'password123'
```

# Usage </br>
1. Head to https://127.0.0.1:6901/ to access the VNC. </br>
2. Enter the login details. Default username is kasm_user. Password is `password` if you did not set it. </br>
3. You will need to go to the config tab and enter your Spotify account details. OTS should be started automatically. If not, there is a desktop icon. </br>
6. Use OTS! </br>
   - The download directory is set by default. Assuming you mounted a host directory correctly, it will download to there. </br>
- Note that you cannot copy and paste directly when using the web browser VNC. You must use the clipboard passthrough. </br>


# Other </br>
Go to [OnTheSpot](https://github.com/casualsnek/onthespot) for extra details on usage. </br>
Because of it basically needing to run an entire Linux system just to use OTS, there are a lot of security issues that I can't effectively patch out by myself. For that, I recommend you use `-p 127.0.0.1:6901:6901` which will only allow your device to access it. Not even other devices on the same network can. I also recommend to stop the container when it's not being used and set `restart: 'no'` so it won't start itself.
