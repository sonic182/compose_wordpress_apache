FROM wordpress

RUN apt-get update && apt-get install -y zlib1g-dev libtidy-dev libzip-dev \
    && docker-php-ext-install zip tidy && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis
