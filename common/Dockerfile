# This dockerfile add all oh-my-zsh and entrypoint file upon the base image
# Modify the first line the change the base image

FROM nvidia/cuda:10.1-cudnn8-devel-ubuntu18.04


###########################
# install common packages #
###########################
RUN apt-get update -y
RUN apt-get install -y \
    wget curl git 
# RUN apt-get install -y --no-install-recommends \
#     wget curl git

# RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

#########################
# Install zsh and OMzsh #
#########################
RUN apt-get update -y
RUN apt-get install -yq zsh 
RUN chsh -s $(which zsh)
# RUN chsh -s /bin/zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting
    # -t tjkirch     

# Do not run the cleanup before the end of all installation
# Early cleanup make apt-get update slower and may cause packages to disappear
RUN rm -rf /var/lib/apt/lists/* 

# Overwrite the entry point to zsh
# WORKDIR /home

CMD ["zsh"]