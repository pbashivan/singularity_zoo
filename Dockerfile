FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get install -y --no-install-recommends \
        bison \
        blender \
        build-essential \
        flex \
        git \
        libgl1-mesa-dev \
        libsdl1.2-dev \
        libtiff5-dev \
        # panda3d \
        python-dev \
        python-pip \
	vim \
	ssh \
        wget \
        && rm -rf /var/lib/apt/lists/*
