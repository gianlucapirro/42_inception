FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl

# WordPress
RUN curl -O https://wordpress.org/latest.tar.gz --insecure 
RUN tar -xzf latest.tar.gz 
RUN rm latest.tar.gz
RUN curl --insecure  -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp-cli
RUN chmod +x /usr/bin/wp-cli

# PHP and extensions
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y php7.3-json 
RUN apt-get install -y php7.3-xml
RUN apt-get install -y php7.3-mbstring
RUN apt-get install -y php7.3-curl
RUN apt-get install -y php7.3-zip
RUN apt-get install -y php7.3-opcache
RUN apt-get install -y php7.3-gd

# Other packages
RUN apt-get install -y mariadb-client 
RUN apt-get install -y sendmail

# Set up
RUN mkdir -p /var/www/html 
RUN mv wordpress/* /var/www/html 
RUN chown -R www-data:www-data /var/www/html 
RUN chmod -R 755 /var/www/html
COPY ./www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir -p /run/php/
RUN touch /run/php/php7.3-fpm.pid
COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh

WORKDIR /var/www/html
