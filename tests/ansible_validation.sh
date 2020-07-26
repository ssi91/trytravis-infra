#!/bin/bash

cd ansible/

pwd
echo "Run ansible linter"
ansible-lint

cd -
