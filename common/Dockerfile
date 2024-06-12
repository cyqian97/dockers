# This dockerfile add all oh-my-zsh and entrypoint file upon the base image
# Modify the first line the change the base image

FROM openvins:humble

WORKDIR /

###########################
# install common packages #
###########################
RUN apt-get update -y \
    && apt-get install -yq \
    wget curl git zsh \
    && chsh -s $(which zsh)

RUN apt-get update -y &&  apt-get install -y build-essential python3 python3-pip

# RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -


#################
# Install OMzsh #
#################
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting
    # -t tjkirch     

COPY ./.zshrc /root/
COPY ./.p10k.zsh /root/

#####################
# Install Miniconda #
#####################
# RUN mkdir miniconda3 &&\
#     wget https://repo.anaconda.com/miniconda/Miniconda3-py37_22.11.1-1-Linux-x86_64.sh -O Miniconda3.sh &&\
#     bash Miniconda3.sh -b -u -p miniconda3 &&\
#     rm -rf Miniconda3.sh &&\
#     miniconda3/bin/conda init bash &&\
#     miniconda3/bin/conda init zsh



#################
# Install noVNC #
#################
# WORKDIR /root

# RUN apt-get update -y && \
#     DEBIAN_FRONTEND=noninteractive apt-get -y install tigervnc-standalone-server novnc openbox lxpanel && \
#     apt-get clean

# COPY ./startVNC.sh /

# RUN echo "export DISPLAY=:1" >> .bashrc && \
#     echo "export DISPLAY=:1" >> .zshrc && \
#     /bin/bash -c "echo -e 'password\npassword\nn' | vncpasswd" && \
#     openssl req -x509 -nodes -newkey rsa:3072 -keyout novnc.pem -out novnc.pem -days 3650 -subj "/C=NA/ST=NA/L=NA/O=NA/OU=NA/CN=NA/emailAddress=NA" && \
#     printf "lxpanel &\n sleep 3 \n openbox-session" >.xinit && \
#     chmod 777 /startVNC.sh /root/.xinit


######################
# ROS extra packages #
######################
# RUN apt-get install -y\
#     ros-melodic-catkin python3-catkin-tools python3-osrf-pycommon

#######################
# ROS2 extra packages #
#######################
# RUN apt-get install -y\
#     ros-humble-rviz2 libeigen3-dev libopencv-dev 

###########
# Cleanup #
###########
# Do not run the cleanup before the end of all installation
# Early cleanup make apt-get update slower and may cause packages to disappear
# RUN rm -rf /var/lib/apt/lists/* 


#############################
# Overwrite the entry point #
#############################
COPY ./ros_entrypoint.zsh /
ENTRYPOINT ["/ros_entrypoint.zsh"]

CMD ["zsh"]
