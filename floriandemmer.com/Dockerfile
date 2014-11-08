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


ENV DOMAIN dragonstone
ENV DB_PASSWORD wordpress
ENV DB_HOST mysqldb


# Add and run provisioning
ADD ansible ${HOME}/ansible
RUN ansible-playbook ${HOME}/ansible/site.yml --extra-vars "domain=${DOMAIN} wp_db_password=${DB_PASSWORD} wp_db_host=${DB_HOST}"


# Volumes
VOLUME /etc/ssl/private
VOLUME /var/log/nginx

# Ports
EXPOSE 80 443
