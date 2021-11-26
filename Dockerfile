FROM debian:buster

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         build-essential \
         ca-certificates \
         cmake \
         git \
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
    && mkdir build \
    && cd build \
    && cmake ../zonation-core \
    && make \
    && cd .. \
    && rm -rf zonation-core

