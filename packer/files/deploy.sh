#!/bin/bash

sudo mv /tmp/puma.service /lib/systemd/system/puma.service

mkdir /opt/infra/
cd /opt/infra && git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

systemctl start puma.service
sudo systemctl enable puma.service

