#
# nginx Dockerfile
#
# based on https://github.com/dockerfile/nginx
#

# Pull base image
FROM ubuntu:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>

# Deal with warnings
ENV TERM xterm

# Install nginx
RUN apt-get update && apt-get install -y \
    nginx

# Update configuration
ADD nginx.conf /etc/nginx/nginx.conf

# Attach volumes
VOLUME /var/log/nginx

# Expose ports
EXPOSE 80 443

# Set working directory
WORKDIR /etc/nginx

# Define default command
ENTRYPOINT ["nginx"]
CMD []
