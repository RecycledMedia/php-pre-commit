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
elif [ `uname` = "Linux" ]; then
    if [ -z "$(command -v php-cs-fixer)" ]; then
        sudo curl -fsSL https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.16.1/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer
        sudo chmod 0755 /usr/local/bin/php-cs-fixer
    fi
fi

for line in "$@"
do
    php-cs-fixer fix "$line" --rules=@PSR2 --allow-risky=no
done
