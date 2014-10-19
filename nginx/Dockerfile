#
# nginx Dockerfile
# ----------------
#
# Based on baseimage. Processes managed by runit.
#    http://phusion.github.io/baseimage-docker
#    https://github.com/dockerfile/nginx
#
#
# Build:
#
#  docker build -t fdemmer/nginx .
#
#
# Usage:
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private:ro
#
# expose port:
#   -p 80:80
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
RUN apt-get update && apt-get install -y ansible python-apt
ADD ansible/hosts /etc/ansible/hosts
ADD ansible ${HOME}/ansible


# Add run scripts
ADD service/phpfpm.sh /etc/service/phpfpm/run
ADD service/nginx.sh /etc/service/nginx/run

# Add configuration
ADD config/nginx.conf /etc/nginx/nginx.conf


# Run ansible
RUN ansible-playbook ${HOME}/ansible/site.yml


# Setup runit
CMD ["/sbin/my_init"]

# Volumes
VOLUME /etc/ssl/private
VOLUME /var/log/nginx

# Ports
EXPOSE 80 443
