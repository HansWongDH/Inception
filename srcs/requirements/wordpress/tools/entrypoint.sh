#!/bin/bash

# if wordpress already installed, give notification else install wordpress

# chown -R www-data:www-data /var/www/html

if [ -f ./wp-config.php ]; then
	echo "wordpress already installed"
else
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root

	cp wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/$WP_DATABASE_NAME/" wp-config.php
    sed -i "s/username_here/$WP_DATABASE_USER/" wp-config.php
    sed -i "s/password_here/$WP_DATABASE_PASSWORD/" wp-config.php
sed -i  "s/localhost/$WP_LOCALHOST/" wp-config.php
wp core install --url=$DOMAIN_NAME --title=Inception --admin_name=$WP_DATABASE_USER --admin_password=$WP_DATABASE_PASSWORD --admin_email=$WP_DATABASE_EMAIL --allow-root
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

fi
sed	-i "s|/run/php/php7.3-fpm.sock|9000|" /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec $@
