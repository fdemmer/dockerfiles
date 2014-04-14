#
# Nginx Dockerfile
#
# based on https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>

# Install Nginx.
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Attach volumes.
VOLUME /etc/nginx/sites-enabled
VOLUME /var/log/nginx

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80

# Define default command.
ENTRYPOINT ["nginx"]