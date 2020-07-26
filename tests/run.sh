#!/bin/bash

DOCKER_IMAGE=express42/otus-homeworks:0.7.1

echo "Run tests custom"
# Prepare network & run container
# docker network create hw-test-net
# docker run -d -v $(pwd):/srv -v /var/run/docker.sock:/tmp/docker.sock \
#     -e DOCKER_HOST=unix:///tmp/docker.sock --cap-add=NET_ADMIN -p 33433:22 --privileged \
#     --device /dev/net/tun --name hw-test --network hw-test-net $DOCKER_IMAGE
# Show versions & run tests
docker exec hw-test bash ./tests/packer_validation.sh
docker exec hw-test bash ./tests/tf_validation.sh
docker exec hw-test bash ./tests/ansible_validation.sh
