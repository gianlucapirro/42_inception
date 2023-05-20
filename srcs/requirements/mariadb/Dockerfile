# Dockerfile for MariaDB

FROM debian:buster

# Install necessary packages
RUN apt-get update && \
    apt-get install -y mariadb-server

RUN apt-get install gettext-base -y


# Copy configuration file
COPY my.cnf /etc/mysql/my.cnf
COPY start_mariadb.sh /start_mariadb.sh

COPY init.sql /init_no_env.sql
# Replace env vars

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

# RUN service mysql start
# RUN echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# RUN mysql -u root -e  "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# RUN mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
# RUN mysql -u root -e "FLUSH PRIVILEGES;"


# CMD ["mysqld", "--default-authentication-plugin=mysql_native_password"]
CMD ["mysqld", "--init-file=/init.sql"] 