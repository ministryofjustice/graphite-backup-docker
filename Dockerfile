FROM phusion/baseimage:0.9.16
MAINTAINER filippos@gmail.com

env WORKDIR /whisper-backup
WORKDIR ${WORKDIR}

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Environment variables setup
#COPY files/container_environment/* /etc/container_environment/


# APT packages setup
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
      git \
      python-dev \
      binutils \
      vim

# pip packages
RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python2.7
RUN git clone https://github.com/ministryofjustice/whisper-backup.git ${WORKDIR} && \ 
    pip install awscli && \
    pip install ${WORKDIR} && \
    pip install boto==2.38.0

COPY files/bin/* /usr/local/bin/

# Daemons setup
# tear down ssh but leave syslog so logging can make it all the way to elk
RUN rm -rf /etc/service/{sshd,crond}

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#VOLUME ["/data"]

#ENTRYPOINT ["/sbin/my_init"]
