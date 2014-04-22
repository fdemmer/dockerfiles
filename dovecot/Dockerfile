#
# dovecot Dockerfile
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private
#
# expose imaps port:
#   -p 993:993
#

# Pull base image
FROM ubuntu:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>

# Deal with warnings
ENV TERM xterm

RUN apt-get update

# Install dovecot
RUN apt-get update && apt-get install -y \
    dovecot-imapd \
    openssl-blacklist \
    ntp

# Attach volumes
VOLUME /etc/ssl/private
#VOLUME /var/log
VOLUME /home

# Expose ports
EXPOSE 143
EXPOSE 993

# Define default command
ENTRYPOINT ["dovecot"]
CMD ["-F", "-c", "/etc/dovecot/dovecot.conf"]
