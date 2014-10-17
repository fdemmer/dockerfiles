#
# MySQL Dockerfile
# ----------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#    http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/
#
#
# Build:
#
#   docker build -t fdemmer/mysql .
#
#
# Usage:
#
# run with a volume pointed to your data dir:
#   -v /data/mysql:/var/lib/mysql
#
# expose port:
#   -p 3306:3306
#

# Pull base image
FROM phusion/baseimage:0.9.15
MAINTAINER Florian Demmer <fdemmer@gmail.com>

ENV LC_ALL C
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Disable baseimage SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


# Upgrade baseimage
RUN apt-get update && apt-get upgrade -y

# Install nginx
RUN apt-get update && apt-get install -y \
    mysql-server-5.6

# Add run script
ADD runit.sh /etc/service/mysql/run
RUN chmod +x /etc/service/mysql/run

# Update configuration
ADD mysql.conf /etc/mysql/conf.d/my.cnf

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Housekeeping
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Setup runit
CMD ["/sbin/my_init"]

# Volumes
VOLUME /var/lib/mysql
VOLUME /var/log/mysql

# Ports
EXPOSE 3306
