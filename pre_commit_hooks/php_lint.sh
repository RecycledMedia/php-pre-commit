#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export PATH=$PATH:/usr/local/bin

if ! which php-cs-fixer &>/dev/null; then
    >&2 echo 'php-cs-fixer command not found'
fi
if [ `uname` = "Darwin" ]; then
    if [ -z "$(command -v brew)" ]; then
        exit 1
    elif [ -z "$(command -v php-cs-fixer)" ]; then
            brew install php-cs-fixer
    fi

    for line in "$@"
    do
        php-cs-fixer fix "$line" --rules=@PSR2 --allow-risky=no
    done
elif [ `uname` = "Linux" ]; then
    for line in "$@"
    do
        docker run -i --rm -v `pwd`:/opt/project gcr.io/tradesy-playground/php-linter:latest fix "$line" --rules=@PSR2 --allow-risky=no
    done
fi
