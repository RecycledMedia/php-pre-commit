#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export PATH=$PATH:/usr/local/bin
rules="--rules=@PSR2 --allow-risky=no"

if ! which php-cs-fixer &>/dev/null; then
    >&2 echo 'php-cs-fixer command not found'
fi
if [ `uname` = "Darwin" ]; then
    if [ -z "$(command -v brew)" ]; then
        exit 1
    elif [ -z "$(command -v php-cs-fixer)" ]; then
            brew install php-cs-fixer
    fi
    exec="php-cs-fixer"
elif [ `uname` = "Linux" ]; then
    exec="docker run -i --rm -v `pwd`:/opt/project gcr.io/tradesy-playground/php-linter:latest"
fi

for line in "$@"
do
#    eval "${exec} fix \"$line\" ${rules}"
     echo "Dimer"
done
