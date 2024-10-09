# Yocto Builder Project

This project sets up a Docker environment for building Yocto projects, ensuring a consistent and isolated build setup.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- **Docker**: Ensure Docker is installed on your system. Follow the [Docker installation guide](https://docs.docker.com/get-docker/) for instructions.
- **Yocto Project Directory**: Have a local directory with your Yocto project ready. Use absolute paths, as Docker only supports them for mounting volumes.

## Setup

1. **Clone the Repository**:

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/keyfour/yocto-builder.git
   cd yocto-builder
   ```

2. **Prepare Your Local Directory**:

   Ensure your Yocto project directory is available. This directory will be mounted into the Docker container.

## Usage

1. **Run the Script**:

   Use the `run_yocto_container.sh` script to build the Docker image and start the container. Replace `<absolute-path-to-your-directory>` with the absolute path to your Yocto project directory.

   ```bash
   ./run_yocto_container.sh <absolute-path-to-your-directory>
   ```

   - The script checks if the provided directory exists.
   - If valid, it builds the Docker image and starts the container with the directory mounted.

2. **Access the Docker Container**:

   Once the container starts, you’ll be in its interactive terminal. Your Yocto project directory is mounted at `/home/yoctobuilder/yocto-project`.

3. **Build Your Yocto Project**:

   Inside the container, navigate to the mounted directory and execute your Yocto build commands.

   ```bash
   cd /home/yoctobuilder/yocto-project
   # Run your Yocto build commands here
   ```

## Troubleshooting

- **Docker Permissions**: Depending on your setup, you might need to use `sudo` for Docker commands.
- **Directory Path**: Ensure the path provided to the script is an absolute path and the directory exists.
- **Script Permissions**: Ensure the `run_yocto_container.sh` script has execute permissions:

  ```bash
  chmod +x run_yocto_container.sh
  ```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any improvements or discussions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

