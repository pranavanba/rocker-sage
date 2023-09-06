# rocker-sage

[![Create and publish a Docker image](https://github.com/pranavanba/rocker-sage/actions/workflows/docker-build-publish.yml/badge.svg)](https://github.com/pranavanba/rocker-sage/actions/workflows/docker-build-publish.yml)

Docker image with up-to-date versions of R, RStudio, tidyverse packages, Synapser, and other packages commonly used by Sage Bionetworks

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

### If running on your local machine

1. Navigate to `localhost:8787` in your browser (container port is already exposed by `-p` in `docker run ...`)
