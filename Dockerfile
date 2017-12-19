FROM naturo/vrep_ros:indigo

RUN apt-get update && apt-get install -y \
    libbluetooth-dev \
    bluez

WORKDIR /root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/indigo/setup.bash; catkin_init_workspace; cd ..; catkin_make'

WORKDIR /root/catkin_ws/src
RUN git clone https://github.com/gctronic/epuck_driver_cpp

WORKDIR /root/catkin_ws
#RUN bash /ros_entrypoint.sh && catkin_make && source devel/setup.bash
RUN /bin/bash -c '. /opt/ros/indigo/setup.bash; catkin_make; source devel/setup.bash'
