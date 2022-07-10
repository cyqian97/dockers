# This dockerfile add all oh-my-zsh and entrypoint file upon the base image
# Modify the first line the change the base image

FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu18.04

# install common packages
RUN apt-get update && apt-get install -y \
    wget curl git \
    && rm -rf /var/lib/apt/lists/*

#########################
# Install zsh and OMzsh #
#########################
RUN apt-get update -y
RUN apt-get install -yq zsh 
RUN rm -rf /var/lib/apt/lists/*
RUN chsh -s $(which zsh)
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting\
    -t tjkirch

CMD ["zsh"]