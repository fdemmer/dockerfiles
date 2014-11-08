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
FROM fdemmer/baseimage:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com


# Add and run provisioning
ADD ansible ${HOME}/ansible
RUN ansible-playbook ${HOME}/ansible/site.yml


# Setup runit
CMD ["/sbin/my_init"]

# Volumes
VOLUME /etc/ssl/private
VOLUME /var/log/nginx

# Ports
EXPOSE 80 443
