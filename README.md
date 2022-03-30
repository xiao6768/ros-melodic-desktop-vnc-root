### ros-melodic-desktop-vnc-root on docker

* Tested under ubuntu18.04 x86-64

* dockerhub: <https://hub.docker.com/repository/docker/xiao6768/ros-melodic-desktop-u18.04-vnc-root> 
* github: <https://github.com/xiao6768/ros-melodic-desktop-vnc-root>


This docker environment is based on :
* osrf/docker_images for [melodic_core](https://github.com/osrf/docker_images/blob/b075c7dbe56055d862f331f19e1e74ba653e181a/ros/melodic/ubuntu/bionic/ros-core/Dockerfile)
* consol/ubuntu-xfce-vnc for [ubuntu-1604-vnc-desktop](https://hub.docker.com/r/consol/ubuntu-xfce-vnc/)
* ros-melodic-desktop-vnc [Here](https://github.com/FloodShao/ros-melodic-desktop-vnc)

Added：
* tigherVNC is not avalible anymore, so download original revision and push into repo.
* enabel root access by default docker access.


#### Build the image from Dockerfile
1. clone the repository in the github [here](https://github.com/xiao6768/ros-melodic-desktop-vnc-root)
2. command `cd ros-melodic-desktop-vnc-root` 
3. command `docker build -t <image_name>/<tag_name> .` under the 'Dockerfile' directory.

#### VNC
Download the vnc viewer client [here](https://www.realvnc.com/en/connect/download/viewer/macos/)

#### Run the image (mind the tag is not 'latest')
1. `docker pull xiao6768/ros-melodic-desktop-u18.04-vnc-root:latest` or build your own image
2. `docker run -it -p 5901:5901 -p 6901:6901 floodshao/ros-melodic-desktop-vnc:v1.0 /bin/bash` , or you just run `./start_ros1_docker.sh` at repo root
3. You can reference the [ubuntu-1604-vnc-desktop](https://hub.docker.com/r/consol/ubuntu-xfce-vnc/) for user modification or password modification.
4. open vnc viewer client, type the server address <localhost:5901>, key in the password: **vncpassword**
5. open the terminal and test gazebo

![test_gazebo](https://github.com/xiao6768/ros-melodic-desktop-vnc-root/blob/master/fig/test_gazebo.png?raw=true)

#### File system
![test_gazebo](https://github.com/xiao6768/ros-melodic-desktop-vnc-root/blob/master/fig/file_sys.png?raw=true)

The default user name is 'default', with the home dir is /headless.
If you want to attach a directory to this docker image, add the `-v` param in the command as follow:

`docker run -it -p 5901:5901 -p 6901:6901 -v /<host_dir>:/<docker_dir>  ros_images/melodic-desktop /bin/bash`

where `<host_dir>` is the absolute dir in your host machine, and `<docker_dir>` is the absolute dir in your docker. 

For example, I will use `-v /$(pwd)/workspace:/headless/workspace` to create a link between the host machine and the docker. After you delete the docker (stop the docker ps), the files in your host machine (as in /$(pwd)/workspace) will not disappear. You can use this feature to load your program locally to your docker environment rather than clone from your git repo each time.  
