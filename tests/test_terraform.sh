#!/usr/bin/env bash

set -e;

# Mock ssh keys
mock_path=~/mock/.ssh;
mkdir -p ${mock_path};

touch ${mock_path}/appuser.pub ${mock_path}/appuser

for env in stage prod; do
  echo Validating ${env}
  cd terraform/${env}
  terraform init -backend=false
  terraform validate -var-file=terraform.tfvars.example
  tflint --var-file=terraform.tfvars.example
  cd -
done
