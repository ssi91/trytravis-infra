#!/bin/bash

# stage
cd ./terraform/stage/

cp ./terraform.tfvars.example ./terraform.tfvars

pwd
terraform validate
tflint
cd -

# prod
cd ./terraform/prod/

cp ./terraform.tfvars.example ./terraform.tfvars

pwd
terraform validate
tflint
cd -
