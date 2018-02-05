FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-pip \
	vim \
	ssh \
        wget \
        && rm -rf /var/lib/apt/lists/*
