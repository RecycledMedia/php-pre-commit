#!/bin/bash

for line in "$@"
do
    docker run -i --rm -v `pwd`:/opt/project gcr.io/tradesy-playground/php-linter:latest fix "$line" --rules=@PSR2 --allow-risky=no
done
