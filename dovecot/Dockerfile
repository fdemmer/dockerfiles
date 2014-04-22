#
# dovecot Dockerfile
#

# Pull base image
FROM ubuntu:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>

# Deal with warnings
ENV TERM xterm

RUN apt-get update

# Install dovecot
RUN apt-get install -y dovecot-imapd
RUN apt-get install -y openssl-blacklist ntp

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
