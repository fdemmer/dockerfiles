#
# Static website with nginx Dockerfile
# ------------------------------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#
#
# Build:
#
#  docker build -t fdemmer/floriandemmer.com .
#
#
# Usage:
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private:ro
#
# expose ports:
#   -p 443:443 -p 80:80
#

# Pull base image
FROM fdemmer/nginx:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>


# Install tools
RUN apt-get update && apt-get install -y \
    git

# Update configuration
RUN rm /etc/nginx/sites-enabled/default
ADD site.conf /etc/nginx/sites-enabled/site.conf

# Bootstrap static site
RUN mkdir /usr/share/nginx/www
RUN cd /usr/share/nginx/www && git clone https://github.com/fdemmer/floriandemmer.com.git

# Housekeeping
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Volumes
VOLUME /etc/ssl/private
VOLUME /usr/share/nginx/www

# Ports
EXPOSE 80 443
