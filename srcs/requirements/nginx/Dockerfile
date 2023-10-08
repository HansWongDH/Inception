# import from debian buster
FROM	debian:buster

# make a working direcotry
RUN		mkdir -p /nginx_workdir
WORKDIR	/nginx_workdir

# install NGINX(-y means auto confirm Yes prompt)
RUN apt-get update && apt-get install -y nginx openssl

# copy NGINX configuration file
COPY /conf /conf
# create custom tls key
RUN mkdir -p /ssl
RUN openssl req -x509 -newkey rsa:2048 -keyout /ssl/cert.key -out /ssl/cert.crt -days 365 -config /conf/ssl.conf -nodes
# expose port 443
EXPOSE 443

# start NGINX daemon off means not detached
CMD ["nginx", "-g", "daemon off;", "-c", "/conf/nginx.conf"]