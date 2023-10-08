FROM debian:buster

RUN apt-get update && apt-get install -y wget php-fpm php-mysql
COPY /tools /tools
RUN chmod +x /tools/entrypoint.sh
# RUN mkdir -p /wordpress_dir
# WORKDIR /wordpress_dir
# RUN chmod +x /wordpress_dir
WORKDIR /var/www/html
RUN chmod +x /var/www/html
EXPOSE 9000
ENTRYPOINT ["/tools/entrypoint.sh"]

CMD ["php-fpm7.3", "-F", "-R"]