FROM php:7.4-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

ADD ./php/php.ini /usr/local/etc/php/php.ini

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

RUN set -ex \
    && apk --no-cache add \
    postgresql-dev

WORKDIR /var/www/html

RUN docker-php-ext-install pdo pdo_pgsql
