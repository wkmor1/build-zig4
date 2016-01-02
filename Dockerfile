FROM ubuntu:trusty-20151208
MAINTAINER William K Morris <wkmor1@gmail.com>

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         build-essential=11.6ubuntu6 \
         ca-certificates \
         cmake=2.8.12.2-0ubuntu3 \
         git=1:1.9.1-1ubuntu0.2 \
         libboost-all-dev=1.54.0.1ubuntu1 \
         libgdal-dev=1.10.1+dfsg-5ubuntu1 \
         libfftw3-dev=3.3.3-7ubuntu3 \
         libqt4-dev=4:4.8.5+git192-g085f851+dfsg-2ubuntu4.1 \
         libqwt-dev=6.0.0-1.2

RUN    git clone https://github.com/cbig/zonation-core \
    && mkdir build \
    && cd build \
    && cmake ../zonation-core \
    && make \
    && tar czf ../zonation.tar.gz .
