# Dockerfile to build Yocto images on Ubuntu 20.04
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    gawk \
    wget \
    git \
    diffstat \
    unzip \
    texinfo \
    gcc-multilib \
    build-essential \
    chrpath \
    socat \
    cpio \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils \
    debianutils \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    libegl1-mesa \
    libsdl1.2-dev \
    pylint3 \
    xterm \
    locales \
    curl  # Added curl installation

RUN apt-get update && \
    apt-get install -y \
    zstd liblz4-tool \
    screen \
    util-linux \
    sudo

RUN apt-get update && \
    apt-get install -y \
    libgl1-mesa-dev \
    mesa-common-dev && \
    rm -rf /var/lib/apt/lists/*


# Set up the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install repo command
RUN mkdir -p /usr/local/bin \
    && curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo \
    && chmod a+x /usr/local/bin/repo

# Create a user to run Yocto build
RUN useradd -ms /bin/bash yoctobuilder \
    && echo "yoctobuilder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/yoctobuilder

# Switch to the yoctobuilder user
USER yoctobuilder
WORKDIR /home/yoctobuilder

# Copy entrypoint script as root and set permissions
USER root
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switch back to yoctobuilder user
USER yoctobuilder

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
