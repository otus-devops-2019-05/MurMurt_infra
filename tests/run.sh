#!/usr/bin/env bash

echo "Custom tests";
for file in $(find ./tests -name 'test_*');
    do
        docker exec -e USER=appuser hw-test ${file};
    done
