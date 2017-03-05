FROM jenkins:latest

USER root
RUN apt-get update

# Install Jade-Lang CLI to allow .jade file compiling
RUN apt-get install -y npm \
 && npm install pug -g \
 && npm install pug-cli -g \
 && ln -s /usr/bin/nodejs /usr/bin/node

# Install Sass-Lang CLI to allow .sass file compiling
# Install Jekyll for static site generation
RUN apt-get install -y rubygems \
 && apt-get install -y ruby-dev \
 && gem install sass \
 && gem install jekyll

# Install Docker to allow image building
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
 && echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list \
 && apt-get install -y apt-transport-https && apt-get update && apt-get install -y docker-engine

ENV JENKINS_OPTS --httpPort=80 --prefix=/jenkins
