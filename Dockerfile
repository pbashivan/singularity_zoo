FROM tensorflow/tensorflow:latest-gpu

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TZ=America/Cancun

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-pip \
	vim \
	ssh \
        wget \
        && rm -rf /var/lib/apt/lists/*
