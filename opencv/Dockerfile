# This dockerfile add opencv upon the base image
# Modify the first line the change the base image
# This file is modified from https://github.com/milq/milq/blob/master/scripts/bash/install-opencv.sh

FROM cyqian97/cuda:11.3.1-cudnn8-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

ARG OPENCV_VERSION="3.2.0"

# 0. Preparation

# Add add-apt-repository command
RUN apt-get -y update
RUN apt-get install -y software-properties-common
RUN apt-get -y update
# Add repository for libjasper-dev
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" 
# RUN add-apt-repository ppa:rock-core/qt4
# RUN apt-get update


# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

RUN apt-get -y update
# RUN apt-get -y upgrade       # Uncomment to install new versions of packages currently installed
# RUN apt-get -y dist-upgrade  # Uncomment to handle changing dependencies with new vers. of pack.
# RUN apt-get -y autoremove    # Uncomment to remove packages that are now no longer needed


# 2. INSTALL THE DEPENDENCIES

# Build tools:
RUN apt-get install -y build-essential cmake

# GUI (if you want GTK, change 'qt5-default' to 'libgtkglext1-dev' and remove '-DWITH_QT=ON'):
RUN apt-get install -y qt5-default libvtk6-dev

# Media I/O:
RUN apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev \
                        libopenexr-dev libgdal-dev

# Video I/O:
RUN apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev \
                        libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm \
                        libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev \
                        ffmpeg x264

# Parallelism and linear algebra libraries:
RUN apt-get install -y libtbb-dev libeigen3-dev

# Python:
RUN apt-get install -y python-dev  python-tk  pylint  python-numpy  \
                        python3-dev python3-tk pylint3 python3-numpy flake8

# Java:
RUN apt-get install -y ant default-jdk

# Documentation and other:
RUN apt-get install -y doxygen unzip wget

# download opencv
RUN curl -sL https://github.com/Itseez/opencv/archive/$OPENCV_VERSION.tar.gz | tar xvz -C /tmp
RUN mkdir -p /tmp/opencv-$OPENCV_VERSION/build

WORKDIR /tmp/opencv-$OPENCV_VERSION/build

# install
RUN cmake -DWITH_FFMPEG=ON -DWITH_CUDA=OFF -DWITH_NVCUVID=OFF \
    -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON \
    -DWITH_XINE=ON -DENABLE_PRECOMPILED_HEADERS=OFF ..
RUN make -j12
RUN make install

# configure
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
RUN ldconfig
RUN ln /dev/null /dev/raw1394 # hide warning - http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394

# cleanup package manager
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Overwrite the entry point to zsh
WORKDIR /
# ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]
