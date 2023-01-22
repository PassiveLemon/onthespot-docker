# onthespot-docker </br>
Docker container for [OnTheSpot](https://github.com/casualsnek/onthespot). </br>
Arch VNC container provided by [DCsunset](https://github.com/DCsunset/docker-i3-arch-vnc). </br>

#### STILL A WIP </br>

# Setting up </br>
1. Clone the repository and cd into it. </br>
2. Build the docker image. I will upload it to Docker eventually. </br>
3. Run it: </br>
`docker run -d --name <name> -p 5900:5900 -p 6080:6080 -v <host download dir>:/root/otsdownloads/ -e VNC_PASSWD=<password> <image name>` </br>
   - Example: `docker run -d --name OnTheSpotDocker -p 5900:5900 -p 6080:6080 -v /home/lemon/Downloads/OnTheSpotDocker/:/root/otsdownloads/ -e VNC_PASSWD=123 otsdockerimage`

### Container Options </br>
Set `<name>` to whatever you want. </br>
Set `<host download dir>` to the location that you want OTS to download songs to. </br>
Set `<password>` to the password you want to use. This MUST be set or it will not work. </br>
Set `<image name>` to the name of the image that you built. </br>

# Usage </br>
Once it is run, it will download i3 for the desktop and build OTS. This may take a few minutes. </br>
1. Head to http://localhost:6080/ to access the VNC. If the container hasn't finished setting up, nothing will show.
2. Enter the password you set earlier to enter. </br>
3. OTS should be started automatically. You will need to go to the config tab and enter your Spotify account details.
   - If the window size is too weird, you can change it by right clicking and dragging the space between the terminal and OTS.
4. Once you do that, close OTS with `alt+shift+q`. </br>
5. Open OTS back up using `alt+shift+p`. </br>
6. Use OTS! The download directory is set by default. Assuming you mounted a host directory correctly, it will just download to there. </br>

# Other </br>

Go to [OnTheSpot](https://github.com/casualsnek/onthespot) for extra details on usage. </br>

The idea behind this is to allow the creation of a portable OTS image. This is achieved using a Docker image of which you VNC into and use the program from there. The VNC is necessary because OTS does not currently support any scripting of any kind unless you modify the source code and build it yourself. You will need to interact with it manually. The reason behind this being a container in the first place is so you can make multiple containers that use different config files. You can also use it if your host OS has difficulty running/building OTS. Ex: NixOS. </br>

The container will create a default config file for minimal functionality. </br>

If OTS ever does get scripting support, I will determine if it is necessary to futher develop this. </br>
</br>

## Development
- Allow customization of config upon startup with environment variables. </br>

- Final step: Upload to Docker hub. </br>

