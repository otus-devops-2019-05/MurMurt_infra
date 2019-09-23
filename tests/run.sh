#!/usr/bin/env bash

echo "Custom tests";
for file in $(find ./tests -name 'test_*' -depth 1);
    do
        echo "Run $file";
#        docker exec -e USER=appuser hw-test ${file};
    done
