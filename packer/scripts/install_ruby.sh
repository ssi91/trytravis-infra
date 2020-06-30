#!/bin/bash

sudo apt update

ps aux | grep -i apt | awk {'print $2'} | xargs kill -9
sudo apt install -y ruby-full ruby-bundler build-essential
