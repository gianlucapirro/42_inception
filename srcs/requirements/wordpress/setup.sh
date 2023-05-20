#!/bin/bash
wp-cli config create \
    --dbhost=${WORDPRESS_DB_HOST} \
	--dbname=${WORDPRESS_DB_NAME} \
	--dbuser=${WORDPRESS_DB_USER} \
	--dbpass=${WORDPRESS_DB_PASSWORD} \
	--allow-root


wp-cli user create \
    ${WORDPRESS_EXTRA_USER} \
    ${WORDPRESS_EXTRA_EMAIL} \
    --user_pass=${WORDPRESS_EXTRA_PASS} \
    --allow-root > /dev/null || true > /dev/null

php-fpm7.3 -F

