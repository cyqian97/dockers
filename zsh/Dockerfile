# This dockerfile add all oh-my-zsh and entrypoint file upon the base image
# Modify the first line the change the base image

FROM celinachild/orbslam2:latestcd 

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

# Overwrite the entry point to zsh
COPY ./ros_entrypoint.zsh /
ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]