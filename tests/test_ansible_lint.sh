#!/usr/bin/env bash
set -e;

echo "Ansible lint";
ansible-lint ansible/playbooks/*.yml;