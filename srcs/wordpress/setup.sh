#!/bin/bash

wp-cli core install \
	--allow-root \
	--url=${WORDPRESS_URL} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASS} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--path=/var/www/html

# /usr/sbin/php-fpm7.3 -F

service php7.3-fpm start
tail -f /dev/null

