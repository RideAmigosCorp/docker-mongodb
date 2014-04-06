#
# MongoDB Dockerfile
#

# Pull base image.
FROM ubuntu

# Install MongoDB specific version of MongoDB (control freak)
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN apt-get install -y mongodb-10gen=2.4.10

# Create default MongoDB data directory.
RUN mkdir -p /data/db

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

# Define an entry point.
ENTRYPOINT ["mongod"]

