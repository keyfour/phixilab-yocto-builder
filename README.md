# Phixilab Yocto Docker Project

This project sets up a Docker environment for building Yocto projects. It uses Docker to create a consistent and isolated build environment.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- **Docker**: Ensure Docker is installed on your machine. For installation, refer to the [Docker installation guide](https://docs.docker.com/get-docker/).
- **Yocto Project Directory**: Have a local directory with your Yocto project ready.

## Setup

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/phixilab-yocto-docker.git
   cd phixilab-yocto-docker
   ```

2. **Prepare Your Local Directory**:

   Make sure your Yocto project directory is ready. This directory will be mounted into the Docker container.

## Usage

1. **Run the Build Script**:

   Execute the `build-yocto.sh` script with your Yocto project directory path. Use an absolute path, as Docker requires it.

   ```bash
   ./build-yocto.sh /absolute/path/to/your/yocto-project
   ```

   - The script checks if the directory exists.
   - If valid, it builds the Docker image and starts the container with the directory mounted.

2. **Access the Docker Container**:

   Once the container starts, you'll be inside its interactive terminal. Your Yocto project directory is mounted at `/home/yoctobuilder/yocto-project`.

3. **Build Your Yocto Project**:

   Inside the container, navigate to the mounted directory and run your Yocto build commands.

   ```bash
   cd /home/yoctobuilder/yocto-project
   # Run your Yocto build commands here
   ```

## Troubleshooting

- **Docker Permissions**: You might need to use `sudo` for Docker commands.
- **Directory Path**: Ensure the provided path is an absolute path and that the directory exists.
- **Script Permissions**: Ensure `build-yocto.sh` is executable:

  ```bash
  chmod +x build-yocto.sh
  ```

## Contributing

Contributions are welcome. Please submit a pull request or open an issue for discussions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This README provides basic instructions for using the Phixilab Yocto Docker project. Adjust any specifics as needed.
