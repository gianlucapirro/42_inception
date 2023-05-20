#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=${MYSQL_USER}  --datadir=/var/lib/mysql
fi

exec mysqld --user=${MYSQL_USER} --console