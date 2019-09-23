#!/usr/bin/env bash
set -e;

echo "Packer validate";
packer validate -var-file=packer/variables.json.example packer/app.json
packer validate -var-file=packer/variables.json.example packer/db.json