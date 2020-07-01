#!/bin/bash

cd

sudo apt-get update
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

cp /home/ubuntu/reddit.service /etc/systemd/system/

sudo systemctl enable reddit
sudo systemctl start reddit || sudo journalctl -xe
