#!/usr/bin/env bash

image_name=hw-test
if [[ "$(docker images -q ${image_name} 2> /dev/null)" != "" ]]; then

echo "Custom tests";
for file in $(find ./tests -name 'test_*');
    do
        docker exec -e USER=appuser ${image_name} ${file};
    done
fi