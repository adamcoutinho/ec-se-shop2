#!/bin/bash

# Kill all running containers.
docker kill $(docker ps -q)

# Delete all stopped containers.
printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)

# Delete all untagged images.
printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)

# Delete all images.
printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q)

# Delete all volumes.
printf "\n>>> Deleting volumes\n\n" && docker volume rm $(docker volume ls -q)

# Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.
printf "\n>>> Deleting unused containers, networks, images and volumes\n\n" && docker system prune -a --volumes