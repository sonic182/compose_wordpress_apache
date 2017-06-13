FROM wordpress:4.7-fpm

RUN apt-get update && apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip && \
    rm -rf /var/lib/apt/lists/*
