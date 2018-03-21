xhost +local:

docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/$(whoami)/work:/root/rvr_ws/src:rw" \
    --device=/dev/dri:/dev/dri \
    --name epuck_vrep_ros_indigo \
    --net host \
    --rm \
    naturo/epuck_vrep_ros
