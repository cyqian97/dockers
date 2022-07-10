FROM cyqian97/cuda:11.3.1-cudnn8-devel-ubuntu18.04-opencv3.2.0

# To build ORB_SLAM2 using this Docker image:
# docker run -v ~/docker/ORB_SLAM2/:/ORB_SLAM2/ -w=/ORB_SLAM2/ slam-test /bin/bash -c ./build.sh

ENV EIGEN_VERSION 3.3.4
ENV EIGEN_DOWNLOAD_URL https://gitlab.com/libeigen/eigen/-/archive/$EIGEN_VERSION/eigen-$EIGEN_VERSION.tar.gz

# install Pangolin
RUN apt-get install -y libglew-dev \
    && git clone https://github.com/stevenlovegrove/Pangolin.git \
    && cd Pangolin \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j16 \
    && make install

# install Eigen
RUN apt-get install libeigen3-dev
# RUN curl -fsSL "$EIGEN_DOWNLOAD_URL" -o eigen.tar.gz \
#   && mkdir /usr/include/eigen \
#   # rename first directory to be eigen instead of eigen-eigen-*
#   && tar -xf eigen.tar.gz --strip-components=1 -C /usr/include/eigen \
#   && rm eigen.tar.gz \
#   && cd  \
#   && mkdir build && cd build \
#   && cmake .. \
#   && make -j16 \
#   && make install

RUN apt-get -y update



# build ORB-SLAM2
RUN git clone https://github.com/cyqian97/ORB_SLAM2.git ORB_SLAM2 \
  && cd ORB_SLAM2 \
  && chmod +x build.sh \
  && ./build.sh

VOLUME ["/ORB_SLAM2/"]

CMD ["bash"]