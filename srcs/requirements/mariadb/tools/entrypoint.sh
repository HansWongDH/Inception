#!/bin/bash

if [ -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
fi

echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$WP_ROOT_PASSWORD';
CREATE DATABASE $WP_DATABASE_NAME;
CREATE USER '$WP_DATABASE_USER'@'%' IDENTIFIED BY '$WP_DATABASE_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USER'@'localhost' IDENTIFIED BY '$WP_DATABASE_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USER'@'%' IDENTIFIED BY '$WP_DATABASE_PASSWORD';
FLUSH PRIVILEGES;" >  temp.sql

mysql_install_db --user=mysql
mysqld --user=mysql --bootstrap < temp.sql
mysqld_safe --user=mysql