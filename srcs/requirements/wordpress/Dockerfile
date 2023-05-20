# Use the Debian Buster Slim base image
FROM debian:buster

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        php7.3-fpm \
        php7.3-mysql \
        php7.3-json \
        php7.3-mbstring \
        php7.3-xml \
        php7.3-gd \
        php7.3-curl \
        php7.3-zip \
        php7.3-opcache && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract WordPress
RUN curl -O https://wordpress.org/latest.tar.gz --insecure && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv wordpress/* /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

COPY ./wp-config.php /var/www/html/wp-config.php

# Configure PHP-FPM
COPY ./www.conf /etc/php/7.3/fpm/pool.d/


WORKDIR /

RUN curl --insecure  -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp-cli
RUN chmod +x /usr/bin/wp-cli

COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh


RUN mkdir -p /run/php/
RUN touch /run/php/php7.3-fpm.pid


WORKDIR /var/www/html
