#
# Static website with nginx Dockerfile
#

# Pull base image
FROM fdemmer/nginx:latest
MAINTAINER Florian Demmer <fdemmer@gmail.com>

# Deal with warnings
ENV TERM xterm

RUN apt-get update
# Install requirements
RUN apt-get install -y git

# Update configuration
ADD site.conf /etc/nginx/sites-enabled/default

# Bootstrap static site
RUN cd /usr/share/nginx/www && git clone https://github.com/fdemmer/floriandemmer.com.git

# Attach volumes
VOLUME /usr/share/nginx/www
