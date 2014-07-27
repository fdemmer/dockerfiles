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
# you might want to keep the ldap data files in a volume:
#   -v /data/ldap:/var/lib/ldap:rw
#
# expose ldap(s) ports if necessary:
#   -p 389:389 -p 636:636
#

# Pull base image
FROM fdemmer/openldap:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>


# Change this to your settings:
ENV LDAP_ROOTPASS passme
ENV LDAP_ORGANISATION Florian Demmer
ENV LDAP_DOMAIN floriandemmer.com

# Add/run config script
ADD config.sh ${HOME}/cm/config.sh
RUN ${HOME}/cm/config.sh
