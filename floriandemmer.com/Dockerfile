#
# Static website Dockerfile
#

# Pull base image.
FROM fdemmer/nginx:latest

# Install requirements
RUN apt-get install -y git

# Update configuration
ADD site.conf /etc/nginx/sites-enabled/default

# Pull static site
RUN cd /usr/share/nginx/www && git clone https://github.com/fdemmer/floriandemmer.com.git

# Attach volumes.
VOLUME /etc/nginx/sites-enabled
VOLUME /usr/share/nginx/www
VOLUME /var/log/nginx

# Set working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80

# Define default command.
ENTRYPOINT ["nginx"]
