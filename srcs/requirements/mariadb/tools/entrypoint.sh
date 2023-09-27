#!/bin/bash

if [ -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
fi

if [ -z "$(ls -A /mariadb_dir)" ]; then

echo "INSTALLING MARIADB";
# install and initialize sql database under the system name of user=mysql and point the output to /dev/null so that it doesn't clutter up the console
    mysql_install_db --user=mysql --datadir=/mariadb_dir
# intialize environment with ENV data
    cat << HEREDOC > /tools/envsetup.sh
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE $WP_DATABASE_NAME
CREATE USER '$WP_DATABASE_USER'@'%' IDENTIFIED by '$WP_DATABASE_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USER'@'localhost' IDENTIFIED by '$WP_DATABASE_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USER'@'%' IDENTIFIED by '$WP_DATABASE_PASSWORD';
FLUSH PRIVILEGES;
HEREDOC
mysqld --user=mysql --bootstrap < /tools/envsetup.sh

rm -f /tools/envsetup.sh
fi

sed -i s/127.0.0.1/mariadb/ /etc/mysql/mariadb.conf.d/50-server.cnf
exec $@