# Use the Debian Buster Slim base image
FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php7.3-json 
RUN apt-get install -y php7.3-mysql
RUN apt-get install -y php7.3-mbstring
RUN apt-get install -y php7.3-xml
RUN apt-get install -y php7.3-gd
RUN apt-get install -y php7.3-curl
RUN apt-get install -y php7.3-zip
RUN apt-get install -y php7.3-opcache
RUN apt-get install -y sendmail

RUN apt-get install -y mariadb-client 

RUN curl -O https://wordpress.org/latest.tar.gz --insecure && tar -xzf latest.tar.gz && rm latest.tar.gz && mkdir -p /var/www/html && mv wordpress/* /var/www/html && chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html


COPY ./www.conf /etc/php/7.3/fpm/pool.d/

WORKDIR /

RUN curl --insecure  -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp-cli
RUN chmod +x /usr/bin/wp-cli

COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh


RUN mkdir -p /run/php/
RUN touch /run/php/php7.3-fpm.pid


WORKDIR /var/www/html
