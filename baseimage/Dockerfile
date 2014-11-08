#
# Dockerfile for baseimage with ansible
# --------------------------------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#
#
# Build:
#
#  docker build -t fdemmer/baseimage .
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


# Setup ansible
RUN apt-get update && apt-get install -y ansible python-apt git
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts


# Setup runit
CMD ["/sbin/my_init"]
