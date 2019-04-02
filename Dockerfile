FROM ubuntu:trusty
MAINTAINER William K Morris <>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         build-essential\
         ca-certificates \
         cmake \
         git\
         libboost-all-dev \
         libgdal-dev \
         libfftw3-dev \
         libqt4-dev \
         libqwt-dev

ENV PATH $PATH:build/zig4

RUN    git clone https://github.com/cbig/zonation-core \
    && mkdir build \
    && cd build \
    && cmake ../zonation-core \
    && make \
    && tar czf ../zonation.tar.gz .
