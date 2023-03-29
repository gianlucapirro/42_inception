
curl --insecure  -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
mv wp-cli.phar /usr/bin/wp-cli
chmod +x /usr/bin/wp-cli
wp-cli core install \
	--allow-root \
	--url=${WORDPRESS_URL} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASS} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--path=/var/www/html

