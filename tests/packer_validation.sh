#!/bin/bash

for file in ./packer/*.json
do
    echo $file
    packer validate -var-file=./packer/variables.json.example $file
done
