#!/bin/bash

# Define the local directory to be mounted
LOCAL_DIR="$1"

# Define the name of the Docker image
IMAGE_NAME="yocto-builder:latest"

# Check if the local directory is provided
if [ -z "$LOCAL_DIR" ]; then
    echo "Usage: $0 <local-directory>"
    exit 1
fi

# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "The directory $LOCAL_DIR does not exist."
    exit 1
fi

# Build the Docker image
docker build -t $IMAGE_NAME .

# Run the Docker container with the mounted volume
# docker run -v "$LOCAL_DIR":/home/yoctobuilder/yocto-project -it $IMAGE_NAME
docker run --privileged -v "$LOCAL_DIR":/home/yoctobuilder/yocto-project -it $IMAGE_NAME

