FROM wordpress:4-fpm

RUN apt-get update && apt-get install -y zlib1g-dev libtidy-dev \
    && docker-php-ext-install zip tidy && \
    rm -rf /var/lib/apt/lists/*

# Memcached extension for php
RUN apt-get update \
    && apt-get -y install libz-dev libmemcached-dev libmemcached11 libmemcachedutil2 build-essential openjdk-7-jre yui-compressor \
    && pecl install memcached-2.2.0 \
    && echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
    && apt-get remove -y build-essential libmemcached-dev libz-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis
