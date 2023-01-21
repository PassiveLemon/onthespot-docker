# onthespot-docker </br>
Docker container for OnTheSpot by casualsnek </br>

## NOT WORKING CURRENTLY. STILL A WIP. </br>

The idea behind this is to allow the creation of a portable OTS image. This is achieved using a Docker image of which you VNC into and use the program from there. The VNC is necessary because OTS does not currently support any scripting of any kind unless you modify the source code and build it yourself. You will need to interact with it manually. The reason behind this being a container in the first place is so you can make multiple which use different config files. </br>

The container will create a default config file for minimal functionality. You will be able to modify it upon creation with environment variables. </br>

If OTS ever does get scripting support, I will determine if it is necessary to futher develop this. </br>
</br>

## Development
- Issues getting OTS to display. Seems to have to do with the Ubuntu image.
- Idealy, building from source would be best for the most frequent updates but, because of building issues (likely having to do with the Ubuntu image again), it is just set to download the prebuild binary and run that. </br>

