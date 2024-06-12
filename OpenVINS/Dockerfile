FROM ros:humble-perception

WORKDIR /root

# Install OpenCV
RUN git clone -b 4.5.5 https://github.com/opencv/opencv/ \
    && git clone -b 4.5.5 https://github.com/opencv/opencv_contrib/ \
    && mkdir opencv/build/ \
    && cd opencv/build/ \
    && cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..\
    && make -j8 \
    && sudo make install

# Install Ceres
RUN sudo apt-get update && sudo apt-get install -y libceres-dev


# Install rviz
RUN apt-get install -y ros-humble-rviz2

