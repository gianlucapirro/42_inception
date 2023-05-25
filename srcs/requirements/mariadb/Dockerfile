# Dockerfile for MariaDB

FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

RUN apt-get install gettext-base -y

COPY my.cnf /etc/mysql/my.cnf
COPY start_mariadb.sh /start_mariadb.sh

COPY init.sql /init_no_env.sql

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_DATABASE=$MYSQL_DATABASE
ENV MYSQL_USER=$MYSQL_USER
RUN envsubst < init_no_env.sql > init.sql
EXPOSE 3306

# Create missing directory
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

CMD ["mysqld", "--init-file=/init.sql"] 