#!/usr/bin/env bash

echo "Ansible lint";
ansible-lint ansible/playbooks/*.yml;