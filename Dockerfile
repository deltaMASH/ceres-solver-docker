FROM ubuntu:bionic

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
  libeigen3-dev \
  libgoogle-glog-dev \
  cmake \
  git \
  libgflags-dev \
  libsuitesparse-dev \
  libatlas-base-dev \
  libopencv-dev \
  vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir /src
WORKDIR /src
RUN git clone https://ceres-solver.googlesource.com/ceres-solver.git
WORKDIR /src/ceres-solver
RUN mkdir build \
  && cd build \
  && cmake ../. \
  && make -j8 \
  && make install
WORKDIR /
RUN rm -rf /src
ENV CMAKE_MODULE_PATH=/usr/local/lib/cmake/Ceres
 
