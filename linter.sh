#!/bin/bash

for line in "$@"
do
    #docker run -it --rm -v `pwd`:/opt/project php-linter fix "$line" --rules=@PSR2
    echo "$line"
done
