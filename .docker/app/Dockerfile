FROM php:7.0-fpm-alpine
MAINTAINER Copious Inc. <engineering@copiousinc.com>

RUN apk add --no-cache --virtual .build-deps \
    curl \
    curl-dev \
    freetype-dev \
    icu-dev \
    libjpeg-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    openssl-dev \
  && NPROC=$(getconf _NPROCESSORS_ONLN) \
  && docker-php-ext-install -j$NPROC \
    bcmath \
    ctype \
    curl \
    dom \
    iconv \
    intl \
    json \
    mbstring \
    mcrypt \
    opcache \
    pdo_mysql \
    soap \
    xml \
    xsl \
    zip \
  && docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$NPROC gd \
  && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer \
  && curl -sS -O https://files.magerun.net/n98-magerun2.phar -o /usr/local/bin/magerun \
  && chmod a+x /usr/local/bin/magerun \
  && apk add --no-cache \
    freetype \
    git \
    icu \
    libjpeg-turbo \
    libmcrypt \
    libpng \
    libxslt \
  && apk del .build-deps

USER www-data
