FROM ubuntu:14.04
MAINTAINER Glyn Jackson (me@glynjackson.org)


##############################################################################
# OS Updates and packages
##############################################################################

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y

##############################################################################
# Add compilers and basic tools
##############################################################################

RUN apt-get install --yes git-core curl wget vim-tiny nano
RUN apt-get install --yes python-pip python2.7 python2.7-dev build-essential g++
RUN apt-get install --yes libapache2-mod-wsgi

##############################################################################
# OpenCV Reqs + gtk libraries for highgui, HDF5 etc
##############################################################################

RUN apt-get install --yes gcc libatlas-base-dev gfortran libeigen3-dev
RUN apt-get install --yes libjpeg-dev libjpeg62 zlib1g-dev libfreetype6 libfreetype6-dev

RUN apt-get install --yes cmake pkg-config libtiff-dev libjasper-dev
RUN apt-get install --yes libgtk2.0-dev libavcodec-dev libavformat-dev
RUN apt-get install --yes libswscale-dev libv4l-dev libopencv-dev libhdf5-dev
RUN apt-get install --yes libboost-python-dev
RUN apt-get install --yes aptitude


##############################################################################
# Install numpy, scipy etc as they are pre-compiled so they install faster
##############################################################################

RUN apt-get install --yes --only-upgrade python-requests

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN ln -s /usr/local/bin/pip /usr/bin/

RUN pip install wheel

ENV PIP_WHEEL_DIR=/wheelhouse
ENV WHEELHOUSE=/wheelhouse
ENV PIP_FIND_LINKS=/wheelhouse

RUN pip wheel numpy==1.10.1
RUN pip install numpy==1.10.1

RUN pip wheel scipy
RUN pip install scipy

RUN pip wheel scikit-learn
RUN pip install scikit-learn

RUN pip wheel Cython
RUN pip install Cython
RUN pip wheel six
RUN pip install six
RUN pip wheel Pillow
RUN pip install Pillow
RUN pip wheel h5py
RUN pip install h5py
RUN pip wheel msgpack-python
RUN pip install msgpack-python
RUN pip wheel matplotlib
RUN pip install matplotlib


# No wheels
RUN pip install scikit-image
RUN pip install pyamg

CMD ["/Done"]
