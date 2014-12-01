# This Dockerfile is used to build an image containing basic stuff to be used as a test environment.

FROM ap_test:base
MAINTAINER Vi Nguyen

ADD ./ /var/tmp/tests



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
