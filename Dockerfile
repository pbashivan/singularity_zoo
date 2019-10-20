FROM tensorflow/tensorflow:1.14.0-gpu-py3
# Takes care of hdf5 error
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-pip \
	vim \
	ssh \
    wget \
	tzdata \
	gcc gfortran binutils \
	xvfb ffmpeg xorg-dev libsdl2-dev swig cmake\
    && rm -rf /var/lib/apt/lists/*

# Set the timezone.
RUN echo "America/New_York" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV TZ=America/New_York
