#!/bin/bash

wp-cli core install \
	--allow-root \
	--url=${WORDPRESS_URL} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASS} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--path=/var/www/html

wp-cli user create \
    ${WORDPRESS_EXTRA_USER} \
    ${WORDPRESS_EXTRA_EMAIL} \
    --user_pass=${WORDPRESS_EXTRA_PASS} \
    --allow-root || true

php-fpm7.3 -F

