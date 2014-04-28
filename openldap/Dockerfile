#
# OpenLDAP Dockerfile
# -------------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#
# References:
#   https://index.docker.io/u/nickstenning/slapd/
#
# Usage:
#
# expose ldap(s) ports:
#   -p 389:389 -p 636:636
#

# Pull base image
FROM phusion/baseimage:0.9.9
MAINTAINER Florian Demmer <fdemmer@gmail.com>

ENV LC_ALL C
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Setup runit
CMD ["/sbin/my_init"]

# Disable baseimage SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


# Install
RUN apt-get update && apt-get install -y \
    slapd \
    ldap-utils

# Add run script
ADD runit.sh /etc/service/slapd/run

# Housekeeping
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Ports
EXPOSE 389 636
