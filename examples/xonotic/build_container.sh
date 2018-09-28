#!/bin/bash
########################################################### {COPYRIGHT-TOP} ####
# Licensed Materials - Property of IBM
# CloudOE
#
# (C) Copyright IBM Corp. 2018
#
# US Government Users Restricted Rights - Use, duplication, or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
########################################################### {COPYRIGHT-END} ####

# Identity file
#PRIVATE_KEY_FILE="~/.ssh/id_rsa_docker"

# Make source code visible in the containers
#MOUNT_FOLDER=/Users/sasadangelo/github.ibm.com/

# Machines private names
CONTAINER_PRIVATE_NAME=xonotic

# Machines private ips
CONTAINER_PRIVATE_IP=10.0.4.41

# Machines ssh port
#STEMCELL1_SSH_PORT=5551

# Docker network names
PRIVATE_NETWORK_NAME=xonotic_private_bridge

# Create a public and private network
docker network create -d bridge --gateway=10.0.4.1 --subnet=10.0.4.1/24 ${PRIVATE_NETWORK_NAME}

# Create the container and associate it to the network
docker create -it --net ${PRIVATE_NETWORK_NAME} -p 26000:26000/udp --ip ${CONTAINER_PRIVATE_IP} --name ${CONTAINER_PRIVATE_NAME} --hostname ${CONTAINER_PRIVATE_NAME} gcr.io/agones-images/xonotic-example:0.3 /bin/bash

# Start the container. By default they will be started in detached mode. This means
# the container is started and prompt is returned immediately. Container will not
# die because ENTRYPOINT in Dockerfile run the /bin/bash shell that never return.
docker start ${CONTAINER_PRIVATE_NAME}

