FROM tensorflow/tensorflow:latest-gpu

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-pip \
	vim \
	ssh \
        wget \
	tzdata \
        && rm -rf /var/lib/apt/lists/*

# Set the timezone.
RUN sudo echo "America/New_York" > /etc/timezone
RUN sudo dpkg-reconfigure -f noninteractive tzdata
