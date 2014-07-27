#
# dovecot Dockerfile
# ------------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#
# Usage:
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private:ro
#
# expose imaps port:
#   -p 993:993
#

# Pull base image
FROM phusion/baseimage:0.9.12
MAINTAINER Florian Demmer <fdemmer@gmail.com>

ENV LC_ALL C
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Disable baseimage SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


# Install
RUN apt-get update && apt-get install -y \
    dovecot-imapd \
    dovecot-ldap \
    openssl-blacklist

# Add run script
ADD runit.sh /etc/service/dovecot/run

# Housekeeping
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Setup runit
CMD ["/sbin/my_init"]

# Volumes
VOLUME /etc/ssl/private
VOLUME /var/mail
VOLUME /var/log

# Ports
EXPOSE 143 993
