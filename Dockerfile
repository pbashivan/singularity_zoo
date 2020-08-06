FROM tensorflow/tensorflow:1.8.0-gpu-py3
# Takes care of hdf5 error
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-pip \
	vim \
	ssh \
    wget \
	tzdata libglew1.5 libglew-dev \
	gcc gfortran binutils \
	xvfb libav-tools xorg-dev libsdl2-dev swig cmake\
    && rm -rf /var/lib/apt/lists/*

# Install mpi from source
RUN wget https://download.open-mpi.org/release/open-mpi/v1.8/openmpi-1.8.1.tar.gz
RUN gunzip -c openmpi-1.8.1.tar.gz | tar xf -
WORKDIR openmpi-1.8.1
RUN ./configure --prefix=/usr/local
RUN make all install

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
# libopenmpi-dev openmpi-bin openmpi-common openmpi-doc

# Set the timezone.
RUN echo "America/New_York" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV TZ=America/New_York

RUN pip install cloudpickle==1.2.1 gym[atari,box2d,classic_control]~=0.15.3 ipython  \
joblib matplotlib==3.0.3 mpi4py numpy pandas pytest psutil scipy seaborn==0.8.1  \
tensorflow==1.8.0 torch==1.3.1 tqdm
# RUN pip install -U mujoco-py