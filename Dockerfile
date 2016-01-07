FROM jenkins:latest

USER root
RUN apt-get update

# Install Jade-Lang CLI to allow .jade file compiling
RUN apt-get install -y npm \
 && npm install jade -g \
 && ln -s /usr/bin/nodejs /usr/bin/node

# Install Sass-Lang CLI to allow .sass file compiling
RUN apt-get install -y rubygems \
 && gem install sass

ENV JENKINS_OPTS --httpPort=80 --prefix=/jenkins
