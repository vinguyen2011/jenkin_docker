# This Dockerfile is used to build an image containing basic stuff to be used as a test environment.

FROM ap_test:base
MAINTAINER Vi Nguyen

ADD ./ /var/tmp/tests

# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Make sure the package repository is up to date.
# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
# RUN apt-get update

# Install python
# RUN apt-get install -y python

# Install pip
# RUN python /var/tmp/tests/get-pip.py

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
