#!/bin/bash
set -e

# Initialize MariaDB data directory if it's empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB server
echo "Starting MariaDB server..."
exec mysqld --user=mysql --console
