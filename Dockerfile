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

WORKDIR /root
RUN git clone https://github.com/andrei91ro/epuck_vrep_ros

WORKDIR /root/rvr_ws/src
RUN /bin/bash -c '. /opt/ros/indigo/setup.bash; catkin_init_workspace; cd ..; source ~/catkin_ws/devel/setup.bash; catkin_make'

#RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc && \
    #echo "source /root/rvr_ws/devel/setup.bash" >> /root/.bashrc && \
    #echo "umask 000" >> /root/.bashrc
RUN echo "source /root/rvr_ws/devel/setup.bash" >> /root/.bashrc && \
    echo "umask 000" >> /root/.bashrc
