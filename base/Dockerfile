#
# nginx Dockerfile
#
# based on https://github.com/dockerfile/nginx
#

# Pull base image
FROM ubuntu:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>

# Deal with warnings
ENV TERM xterm

# Install tools
RUN apt-get update && apt-get install -y \
    git \
    ntp
