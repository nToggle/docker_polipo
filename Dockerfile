FROM phusion/baseimage
MAINTAINER Ashley Penney <apenney@ntoggle.com>

# Ensures apt doesn't ask us silly questions:
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Add the Foreman repos
RUN apt-get update --fix-missing && apt-get -y upgrade && \
    apt-get -y install polipo && apt-get -y clean

# Set up runit
COPY polipo.sh /etc/service/polipo/run

EXPOSE 8123
CMD ["/sbin/my_init"]
