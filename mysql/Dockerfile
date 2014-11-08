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
FROM fdemmer/baseimage:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>


ENV DB_PASSWORD wordpress

# Add and run provisioning
ADD ansible ${HOME}/ansible
RUN ansible-playbook ${HOME}/ansible/site.yml


# Setup runit
CMD ["/sbin/my_init"]

# Volumes
VOLUME /var/lib/mysql
VOLUME /var/log/mysql

# Ports
EXPOSE 3306
