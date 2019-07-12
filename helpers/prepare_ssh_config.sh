#!/bin/bash
if grep -q "ProxyJump bastion_jump" ~/.ssh/config; then
    echo "ProxyJump already added"
else
    DIR="$(dirname "${BASH_SOURCE[0]}")"
    cat ${DIR}/ssh_jump_config >> ~/.ssh/config
fi
