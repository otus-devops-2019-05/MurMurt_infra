#!/bin/bash

gcloud compute instances create baked \
--boot-disk-size=10GB \
--image-family=reddit-full \
--machine-type=g1-small \
--tags=puma-server \
--restart-on-failure

