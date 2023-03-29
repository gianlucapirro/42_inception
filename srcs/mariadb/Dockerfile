# Dockerfile for MariaDB

FROM debian:buster

# Install necessary packages
RUN apt-get update && \
    apt-get install -y mariadb-server

# Copy configuration file
COPY my.cnf /etc/mysql/my.cnf
COPY start_mariadb.sh /start_mariadb.sh

# Create missing directory
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

# Expose ports
EXPOSE 3306

# Start MariaDB server
CMD ["/start_mariadb.sh"]
