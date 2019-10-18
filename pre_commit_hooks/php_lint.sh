#!/bin/bash

for line in "$@"
do
    docker run -i --rm -v `pwd`:/opt/project php-linter fix "$line" --rules=@PSR2
done
