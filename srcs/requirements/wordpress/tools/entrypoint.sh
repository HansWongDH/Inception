#!/bin/bash

# if wordpress already installed, give notification else install wordpress

if [ -f ./wp-config.php ]; then
	echo "wordpress already installed"
else
	wget https://wordpress.org/latest.tar.gz
    tar -xzvf latest.tar.gz
    mv wordpress/* .
	rm -rf latest.tar.gz

	cp wp-config-sample.php wp-config.php
	# wp config set WP_HOME https://$DOMAIN_NAME --allow-root
	sed -i "s/database_name_here/$WP_DATABASE_NAME/" wp-config.php
    sed -i "s/username_here/$WP_USER/" wp-config.php
    sed -i "s/password_here/$WP_PASSWORD/" wp-config.php


	# if [ -f /etc/php/7.3/fpm/pool.d/www.conf ];	then
	# 	cp /etc/php/7.3/fpm/pool.d/www.conf /etc/php/7.3/fpm/pool.d/www.default.conf
	# fi
fi

sed	-i "s|/run/php/php7.3-fpm.sock|9000|" /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec $@
