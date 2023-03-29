# Use the Debian Buster Slim base image
FROM debian:buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        nginx \
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

# Configure Nginx
COPY ./nginx.conf /etc/nginx/sites-available/default

# Configure PHP-FPM
COPY ./php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./setup.sh /setup.sh

# Expose the default Nginx port
EXPOSE 80

# Set the working directory
WORKDIR /var/www/html

# Start Nginx and PHP-FPM
CMD service php7.3-fpm start && nginx -g "daemon off;"
