FROM debian:buster

RUN apt-get update && apt-get install -y wget php-fpm

COPY /tools /tools
RUN chmod +x /tools/entrypoint.sh
ENTRYPOINT ["/tools/entrypoint.sh"]
RUN mkdir -p /wordpress_dir
WORKDIR /wordpress_dir

# expose port 9000
EXPOSE 9000

CMD ["php-fpm7.3", "-F"]