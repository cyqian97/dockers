# This dockerfile add opencv upon the base image
# Modify the first line the change the base image
# This file is modified from https://github.com/milq/milq/blob/master/scripts/bash/install-opencv.sh

FROM cyqian97/cuda:11.6.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG OPENCV_VERSION="4.6.0"

# 0. Preparation
# 0.0 setup timezone to avoid interaction
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime 

# 0.1 Add add-apt-repository command
RUN apt-get -y update
RUN apt-get install -y software-properties-common
RUN apt-get -y update

# 0.2 Install dependencies for SFM module
RUN apt-get install libeigen3-dev libgflags-dev libgoogle-glog-dev cmake libatlas-base-dev -y 
RUN apt-get install libsuitesparse-dev -y
# RUN git clone https://ceres-solver.googlesource.com/ceres-solver && \
RUN wget -O ceres-solver-1.14.0.tar.gz https://ceres-solver.googlesource.com/ceres-solver/+archive/facb199f3eda902360f9e1d5271372b7e54febe1.tar.gz
RUN mkdir ceres-solver-1.14.0 && \
    tar xvf ceres-solver-1.14.0.tar.gz --directory ceres-solver-1.14.0 && \
    cd ceres-solver-1.14.0 && \
    mkdir build && cd build && \
    cmake .. && \
    make -j4 && \
    make test && \
    make install

# 0.3 Install minimal prerequisites (Ubuntu 18.04 as reference)
RUN apt-get update -y && apt-get install -y cmake g++ wget unzip
RUN apt-get install python3-pip -y
RUN python3 -m pip install numpy 

# 1. Install OpenCV
# 1.0 Download and unpack sources
WORKDIR /
RUN mkdir opencv
WORKDIR /opencv/
RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.6.0.zip
RUN wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.6.0.zip
RUN unzip opencv.zip
RUN unzip opencv_contrib.zip
RUN mkdir -p build && cd build && \
    cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.6.0/modules \
     -D WITH_OPENMP=ON \
    -D BUILD_opencv_alphamat=OFF \
    -D BUILD_opencv_aruco=OFF \
    -D BUILD_opencv_barcode=OFF \
    -D BUILD_opencv_bgsegm=OFF \
    -D BUILD_opencv_bioinspired=OFF \
    -D BUILD_opencv_ccalib=OFF \
    -D BUILD_opencv_ccalib=OFF \
    -D BUILD_opencv_cvv=OFF \
    -D BUILD_opencv_dnn_objdetect=OFF \
    -D BUILD_opencv_dnn_superres=OFF \
    -D BUILD_opencv_face=OFF \
    -D BUILD_opencv_face=OFF \
    -D BUILD_opencv_fuzzy=OFF \
    -D BUILD_opencv_hdf=OFF \
    -D BUILD_opencv_julia=OFF \
    -D BUILD_opencv_line_descriptor=OFF \
    -D BUILD_opencv_mcc=OFF \
    -D BUILD_opencv_phase_unwrapping=OFF \
    -D BUILD_opencv_stereo=OFF \
    -D BUILD_opencv_structured_light=OFF \
    -D BUILD_opencv_text=OFF \
    -D BUILD_opencv_tracking=OFF \
    -D BUILD_opencv_viz=OFF \
    -D BUILD_opencv_ximgproc=OFF \
    -D BUILD_opencv_xphoto=OFF \
    ../opencv-4.6.0 && \
    cmake --build .

# cleanup package manager
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


# Overwrite the entry point to zsh
WORKDIR /
# ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]
