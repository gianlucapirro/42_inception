# Use the Debian Buster Slim base image
FROM debian:buster

RUN apt-get update && apt-get upgrade -y

# Install CURL first since it's used in subsequent steps
RUN apt-get install -y curl

# Download WordPress
RUN curl -O https://wordpress.org/latest.tar.gz --insecure 
RUN tar -xzf latest.tar.gz 
RUN rm latest.tar.gz 

# Download wp-cli
RUN curl --insecure  -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp-cli
RUN chmod +x /usr/bin/wp-cli

# Install PHP and its extensions
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-curl
RUN apt-get install -y php7.3-mbstring
RUN apt-get install -y php7.3-xml
RUN apt-get install -y php7.3-zip
RUN apt-get install -y php7.3-json 
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y php7.3-opcache
RUN apt-get install -y php7.3-gd

# Install other packages
RUN apt-get install -y sendmail
RUN apt-get install -y mariadb-client 

# Set up WordPress
RUN mkdir -p /var/www/html 
RUN mv wordpress/* /var/www/html 
RUN chown -R www-data:www-data /var/www/html 
RUN chmod -R 755 /var/www/html

# Set up PHP
COPY ./www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir -p /run/php/
RUN touch /run/php/php7.3-fpm.pid

# Set up the rest
COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh

# Set the working directory
WORKDIR /var/www/html
