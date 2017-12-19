xhost +local:

docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --device=/dev/dri:/dev/dri \
    --name epuck_vrep_ros_indigo \
    --hostname epuck_vrep_ros_indigo \
    --rm \
    naturo/epuck_vrep_ros:indigo \
