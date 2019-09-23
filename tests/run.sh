#!/usr/bin/env bash

echo "Custom tests";
for file in $(find ./tests -d 1 -name "test_*");
    do
        echo "Run $file";
        docker exec -e USER=appuser hw-test ${file};
    done
