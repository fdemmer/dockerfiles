#
# Static website with nginx Dockerfile
#
# run with a volume pointed to the ssl cert/key:
#   -v /root/ssl:/etc/ssl/private
#
# expose http and https porta:
#   -p 443:443 -p 80:80
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
RUN rm /etc/nginx/sites-enabled/default
ADD site.conf /etc/nginx/sites-enabled/site.conf

# Bootstrap static site
RUN cd /usr/share/nginx/www && git clone https://github.com/fdemmer/floriandemmer.com.git

# Attach volumes
VOLUME /etc/ssl/private
VOLUME /usr/share/nginx/www
