#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export PATH=$PATH:/usr/local/bin

if ! which eslint &>/dev/null; then
    >&2 echo 'eslint command not found'

    if [ -z "$(command -v npm)" ]; then
        exit 1
    fi

    npm install -g eslint
fi

for line in "$@"
do
    eval "eslint --fix \"${line}\""
done
