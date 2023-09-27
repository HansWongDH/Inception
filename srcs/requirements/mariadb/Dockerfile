FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY /tools /tools
RUN chmod +x /tools/entrypoint.sh
ENTRYPOINT ["/tools/entrypoint.sh"]
RUN mkdir -p /mariadb_dir
WORKDIR /mariadb_dir
CMD ["mysqld", "--user=mysql", "--datadir=/mariadb_dir"]