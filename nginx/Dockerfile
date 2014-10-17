#
# nginx Dockerfile
# ----------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#    https://github.com/dockerfile/nginx
#
# Usage:
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private:ro
#
# expose imaps port:
#   -p 443:443
#

# Pull base image
FROM phusion/baseimage:0.9.15
MAINTAINER Florian Demmer <fdemmer@gmail.com>

ENV LC_ALL C
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Disable baseimage SSH
#RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


# Upgrade baseimage
RUN apt-get update && apt-get upgrade -y

# Install nginx
RUN apt-get update && apt-get install -y \
    nginx

# Add run script
ADD runit.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# Update configuration
ADD nginx.conf /etc/nginx/nginx.conf

# Housekeeping
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Setup runit
CMD ["/sbin/my_init"]

# Volumes
VOLUME /etc/ssl/private
VOLUME /var/log/nginx

# Ports
EXPOSE 80 443
