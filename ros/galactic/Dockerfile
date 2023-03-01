FROM cyqian97/ubuntu:focal

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# setup sources.list
RUN echo "deb http://snapshots.ros.org/galactic/final/ubuntu focal main" > /etc/apt/sources.list.d/ros2-snapshots.list

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 4B63CF8FDE49746E98FA01DDAD19BAB3CBF125EA

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO galactic

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-galactic-desktop=0.9.3-2* \
    ros-$ROS_DISTRO-ros2bag \
    python3-colcon-common-extensions \
    libeigen3-dev libboost-all-dev libceres-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./ros_entrypoint.zsh /

ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]