#!/bin/bash

set -e

sleep 30

APP_DIR=${1:-$HOME}

sudo apt-get install -y git

git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd  $APP_DIR/reddit && bundle install

sudo cp /tmp/puma.service /etc/systemd/system/

sudo systemctl enable puma
sudo systemctl start puma
