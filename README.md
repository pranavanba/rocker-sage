# rocker-sage

[![Create and publish a Docker image](https://github.com/pranavanba/rocker-sage/actions/workflows/docker-build-publish.yml/badge.svg)](https://github.com/pranavanba/rocker-sage/actions/workflows/docker-build-publish.yml)

Docker image with up-to-date versions of R, RStudio, tidyverse packages, Synapser, and other packages commonly used by Sage Bionetworks.

See the full list of included tools, utilities, and libraries [below](#features)

## Usage

### 1. Pull the docker image

```sh
docker pull ghcr.io/pranavanba/rocker-sage:main
```

### 2. Run a container using the image

* Replace `<container-name>` with the desired name of your container
* `-p` binds port `8787` of the host machine to port `8787` of the container (feel free to change the ports as needed)
* `PASSWORD` is the password you set for RStudio Server
* `$SYNAPSE_AUTH_TOKEN` passes the value of the environment variable of the same name to the container (refer to the instructions [here](https://help.sc.sageit.org/sc/Service-Catalog-Provisioning.938836322.html#ServiceCatalogProvisioning-CreateaSynapsepersonalaccesstoken) to learn how to provision a personal access token for a Synapse account)
* Use `--rm` if you would like the container to automatically remove upon exiting

```sh
docker run --name <container-name> -d -p 8787:8787 -e PASSWORD=password -e SYNAPSE_AUTH_TOKEN=$SYNAPSE_AUTH_TOKEN ghcr.io/pranavanba/rocker-sage:main
```

### 3. Connect to the RStudio Server

#### If running from inside an EC2 instance, VM, etc.

1. Forward the port published by your `docker run` command (e.g. `"localPortNumber":["8787"], "portNumber":["8787"]`)
2. Navigate to `localhost:8787` in your browser

#### If running on your local machine

1. Navigate to `localhost:8787` in your browser (container port is already exposed by `-p` in `docker run ...`)

## Features

This Dockerfile is based on the `rocker/tidyverse` image and includes various useful system utilities, development tools, and libraries as noted below.

### System Utilities

- `git`: Version control system
- `curl`: Command-line tool for transferring data with URLs
- `ssh`: Secure Shell protocol for secure remote access
- `nano`: Text editor for the command line
- `less`: Pager program for viewing text files
- `unzip`: Utility for extracting compressed archive files

### Development Tools

- `python3`: Python 3 interpreter
- `python3-pip`: Python package manager
- `python3-venv`: Python virtual environment module
- `libssl-dev`: Development files for OpenSSL
- `libcurl4-openssl-dev`: Development files for libcurl
- `libpng-dev`: Development files for libpng
- `libglpk-dev`: Development files for the GNU Linear Programming Kit (GLPK)
- `libxt-dev`: Development files for X Toolkit (Xt)
- `liblzma-dev`: Development files for the liblzma library
- `libbz2-dev`: Development files for the libbz2 library
- `groff`: GNU troff text formatting system

### R Packages

- `Tidyverse`: Tidyverse packages are included from the `rocker/tidyverse` base image
- `reticulate`: Use Python in R
- `synapser`: Interface to Synapse
- `synapserutils`: Utility functions built on top of `synapser`

### Python Packages

- `synapseclient`: Client for Synapse
- `virtualenv`: Create a python virtual environment

### Additional Components

- **AWS CLI**: AWS Command Line Interface for interacting with AWS services
- **AWS Session Manager Plugin**: A plugin for AWS CLI for session management on AWS instances
- **AWS Config File**: AWS configuration file (`config`) for AWS CLI setup
- **Synapse Credentials Setup**: Includes a shell script (`synapse_creds.sh`) for configuring Synapse credentials
