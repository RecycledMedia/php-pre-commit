FROM php:7.1.1-alpine

ARG PHP_CS_FIXER_VERSION=2.15.2

RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v${PHP_CS_FIXER_VERSION}/php-cs-fixer.phar > /usr/local/bin/php-cs-fixer \
    && chmod +x /usr/local/bin/php-cs-fixer \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

VOLUME ["/opt/project"]
WORKDIR /opt/project

ENTRYPOINT ["php-cs-fixer"]
