# This dockerfile add all ros packages and entrypoint file upon the base image
# Modify the first line the change the base image

FROM cyqian97/ubuntu:focal AS base

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO noetic

####################
# Install ros-core #
####################
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
RUN echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

###############
# Install ros #
###############

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full=1.5.0-1* 

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-vcstools 

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO


###########################
# install common packages #
###########################
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl git python3-catkin-tools python3-osrf-pycommon ros-$ROS_DISTRO-catkin\
    && rm -rf /var/lib/apt/lists/*

#########################
# Install zsh and OMzsh #
#########################
# RUN apt-get update -y
# RUN apt-get install -yq zsh 
# RUN rm -rf /var/lib/apt/lists/*
# RUN chsh -s $(which zsh)
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
#     -p git \
#     -p https://github.com/zsh-users/zsh-autosuggestions \
#     -p https://github.com/zsh-users/zsh-syntax-highlighting\
#     -t tjkirch

# Overwrite the entry point to zsh
COPY ./ros_entrypoint.zsh /
ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]