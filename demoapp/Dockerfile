# Base Image
FROM ubuntu:14.04

#Setup NGINX
RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu lucid main" > /etc/apt/sources.list.d/nginx-stable-lucid.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
    apt-get update && \
    apt-get install -y nginx && \
    echo 'daemon off;' >> /etc/nginx/nginx.conf

# ContainerSettings
CMD ["nginx"]