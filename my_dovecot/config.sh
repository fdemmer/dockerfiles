#!/bin/sh

set -x
: DOVECOT_LDAP_HOSTS=${DOVECOT_LDAP_HOSTS}
: DOVECOT_LDAP_BASE=${DOVECOT_LDAP_BASE}
: DOVECOT_LDAP_ATTRS=${DOVECOT_LDAP_ATTRS}
: DOVECOT_LDAP_USERDN=${DOVECOT_LDAP_USERDN}


HOST_ADDR=$(/sbin/ip route | awk '/default/ { print $3 }')
MAIL_UID=$(id -u dovecot)
MAIL_GID=$(id -g dovecot)


CONF="/etc/dovecot"
