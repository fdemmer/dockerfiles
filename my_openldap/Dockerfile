#
# OpenLDAP configuration Dockerfile
# ---------------------------------
#
# Usage:
#
# change settings below before build!
#
# to configure later run image with ${HOME}/cm/config.sh as CMD
# and ENV variables for the settings:
#   -e LDAP_ROOTPASS $3cR37p4sSw0rD
#
# then commit and run again setting runit as CMD:
#   /sbin/my_init
#

# Pull base image
FROM fdemmer/openldap:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>


# Change this to your settings:
ENV LDAP_ROOTPASS passme
ENV LDAP_ORGANISATION Florian Demmer
ENV LDAP_DOMAIN floriandemmer.com


RUN ${HOME}/cm/config.sh
