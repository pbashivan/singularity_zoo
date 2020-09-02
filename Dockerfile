FROM torchbeast/ci-polybeast-cpu37:latest
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

# Anaconda installing

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b
RUN rm Miniconda3-latest-Linux-x86_64.sh

# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all

RUN mkdir /temp
WORKDIR /temp
RUN git clone https://github.com/facebookresearch/torchbeast.git
WORKDIR /temp/torchbeast
RUN pip install -r requirements.txt
# RUN git submodule update --init --recursive
# RUN conda install -c anaconda protobuf --yes
# RUN ./scripts/install_grpc.sh
# RUN pip install nest/
# RUN export LD_LIBRARY_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}/lib:${LD_LIBRARY_PATH}
# RUN python setup.py install

# Set the timezone.
RUN echo "America/New_York" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV TZ=America/New_York
