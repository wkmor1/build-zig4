FROM ubuntu
MAINTAINER William K Morris <wkmor1@gmail.com>

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

RUN    git clone https://github.com/cbig/zonation-core \
    && mkdir build \
    && cd build \
    && cmake ../zonation-core \
    && make \
    && tar czf ../zonation.tar.gz .
