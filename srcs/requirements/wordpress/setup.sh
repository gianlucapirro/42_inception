#!/bin/bash
wp-cli config create \
    --dbhost=${WP_DB_HOST} \
	--dbname=${WP_DB_NAME} \
	--dbuser=${WP_DB_USER} \
	--dbpass=${WP_DB_PASS} \
	--allow-root 2>/dev/null

wp-cli core install \
	--allow-root \
	--url=${WP_URL} \
	--title=${WP_TITLE} \
	--admin_user=${WP_ADMIN_USER} \
	--admin_password=${WP_ADMIN_PASS} \
	--admin_email=${WP_ADMIN_EMAIL} \
	--path=/var/www/html 2> /dev/null

wp-cli user create \
    ${WP_EXTRA_USER} \
    ${WP_EXTRA_EMAIL} \
    --user_pass=${WP_EXTRA_PASS} \
    --allow-root 2>/dev/null || true 

php-fpm7.3 -F

