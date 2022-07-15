# This dockerfile add all oh-my-zsh and entrypoint file upon the base image
# Modify the first line the change the base image

FROM celinachild/orbslam2:latest


###########################
# install common packages #
###########################
RUN apt-get update -y
RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo apt-get install curl -y
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl git \
    && rm -rf /var/lib/apt/lists/*

#########################
# Install zsh and OMzsh #
#########################
RUN apt-get update -y
RUN apt-get install -yq zsh 
RUN rm -rf /var/lib/apt/lists/*
RUN chsh -s $(which zsh)
# RUN chsh -s /bin/zsh
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
#     -p git \
#     -p https://github.com/zsh-users/zsh-autosuggestions \
#     -p https://github.com/zsh-users/zsh-syntax-highlighting\
#     -t tjkirch \





# Overwrite the entry point to zsh
COPY ./ros_entrypoint.zsh /
ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]