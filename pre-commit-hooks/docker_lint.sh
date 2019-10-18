#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export PATH=$PATH:/usr/local/bin

if ! which hadolint &>/dev/null; then
    >&2 echo 'hadolint command not found'
fi
if [ `uname` = "Darwin" ]; then
    if [ -z "$(command -v brew)" ]; then
        exit 1
    elif [ -z "$(command -v hadolint)" ]; then
            brew install hadolint
    fi
elif [ `uname` = "Linux" ]; then
    if [ -z "$(command -v hadolint)" ]; then
        sudo curl -fsSL https://github.com/hadolint/hadolint/releases/download/v1.17.1/hadolint-Linux-x86_64 -o /usr/local/bin/hadolint
        sudo chmod 0755 /usr/local/bin/hadolint
    fi
fi

hadolint "$@"
