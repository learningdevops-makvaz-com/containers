FROM ubuntu:22.04

LABEL maintainer="korneevayu@gmail.com"

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

ENV PHP_VERSION 8.3

# Install Craft Requirements
RUN set -x \
    && apt-get update \
    && apt-get install -yq --no-install-recommends \
        apt-utils \
        curl \
        gnupg2 \
        iproute2 \
        mysql-client \
        python-pip \
        # python-setuptools \
        # python-wheel-common \
        software-properties-common \
        unzip \
        zip \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y \
    && curl -o /usr/share/keyrings/nginx_signing.key http://nginx.org/keys/nginx_signing.key \
    && echo "deb [signed-by=/usr/share/keyrings/nginx_signing.key] http://nginx.org/packages/mainline/ubuntu/ jammy nginx" > /etc/apt/sources.list.d/nginx.list \
    && apt-get update && apt-get install -yq --no-install-recommends \
        nginx \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-dom \
        php${PHP_VERSION}-exif \
        php${PHP_VERSION}-fpm \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-gmp \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-readline \
        php${PHP_VERSION}-soap \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-zip \
        php${PHP_VERSION}-imagick \
        php${PHP_VERSION}-redis \
    && python2 -m pip install --no-cache-dir supervisor supervisor-stdout \
    && printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d \
    && apt-get autoremove --purge -y \
        software-properties-common \
        gnupg2 \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/*

# Configure PHP-FPM
COPY conf/php/php-fpm.conf /etc/php/${PHP_VERSION}/fpm/php-fpm.conf
COPY conf/php/php.ini /etc/php/${PHP_VERSION}/fpm/php.ini
COPY conf/php/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

# Nginx config
COPY conf/nginx /etc/nginx

# Supervisor config
COPY conf/supervisor/supervisord.conf /etc/supervisord.conf

# Override default nginx welcome page
COPY index.php /var/www/html/index.php

# Copy Scripts
COPY start.sh /start.sh
RUN chmod 755 /start.sh

RUN chown -R www-data:www-data /var/cache/nginx \
    && chown -R www-data:www-data /var/log/nginx \
    && mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && chown -R www-data:www-data /etc/nginx \
    && touch /var/run/nginx.pid \
    && chown -R www-data:www-data /var/run/nginx.pid \
    && touch /var/log/php-fpm.log \
    && mkdir -p /var/run/php/ \
    && touch /var/run/php/ \
    && chown -R www-data:www-data /var/log/php-fpm.log /var/run/php/

# run container as the www-data user
USER www-data

EXPOSE 80
ENTRYPOINT ["/start.sh"]
