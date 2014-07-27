#
# dovecot Dockerfile
# ------------------
#
# Usage:
#
# change settings below before build!
#
# to configure later run image with ${HOME}/cm/config.sh as CMD
# and ENV variables for the settings, eg.:
#   -e DOVECOT_LDAP_USERDN uid=%u,cn=imap,dc=floriandemmer,dc=com
#
# then commit and run again setting runit as CMD:
#   /sbin/my_init
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private:ro
#
# expose imaps port(s) if necessary:
#   -p 143:143 -p 993:993
#

# Pull base image
FROM fdemmer/dovecot:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>


# Change this to your settings:
ENV DOVECOT_LDAP_HOSTS localhost:389
ENV DOVECOT_LDAP_BASE ou=People,dc=floriandemmer,dc=com
ENV DOVECOT_LDAP_ATTRS homeDirectory=home
ENV DOVECOT_LDAP_USERDN uid=%u,ou=People,dc=floriandemmer,dc=com

# Add/run config script
ADD config.sh ${HOME}/cm/config.sh
RUN ${HOME}/cm/config.sh
