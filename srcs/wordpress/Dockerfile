# Dockerfile for WordPress

FROM debian:buster

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget php-fpm php-mysql

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    rm latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv wordpress/* /var/www/html/

# Create missing directory
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# Copy configuration file
COPY php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf

# Start PHP-FPM
# CMD ["php-fpm7.3"]
