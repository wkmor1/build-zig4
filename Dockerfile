FROM ubuntu:trusty

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
         libqwt-dev \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf var/lib/apt/lists/*

ENV PATH $PATH:/build/zig4

RUN    git clone https://github.com/cbig/zonation-core \
    && cd zonation-core \
    && git checkout bcb4e612f59342c2931886dd930aac0051f79fe0 \
    && cd .. \
    && mkdir build \
    && cd build \
    && cmake ../zonation-core \
    && make \
    && cd .. \
    && rm -rf zonation-core
