#!/bin/bash
wp core config
    --dbhost=${WORDPRESS_DB_HOST} \
	--dbname=${WORDPRESS_DB_NAME} \
	--dbuser=${WORDPRESS_DB_USER} \
	--dbpass=${WORDPRESS_DB_PASSWORD} \
	--allow-root

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
    --allow-root > /dev/null || true > /dev/null

php-fpm7.3 -F

