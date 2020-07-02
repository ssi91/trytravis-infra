#!/bin/bash

echo $1

yc compute instance create \
--name "$1" \
--hostname "$1" \
--memory=4 \
--create-boot-disk image-folder-id=b1gk3lh4l14o2l4ujhc5,image-family=reddit-full,size=20GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--ssh-key ~/.ssh/appuser.pub

# --metadata-from-file user-data=metadata.yaml
