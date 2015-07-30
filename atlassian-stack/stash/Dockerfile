FROM handcraftedbits/oraclejdk-8:latest
MAINTAINER HandcraftedBits <opensource@handcraftedbits.com>

ENV STASH_HOME /opt/data/stash
ENV STASH_VERSION 3.11.1

VOLUME /opt/data/certs
VOLUME /opt/data/stash

EXPOSE 7990

RUN cd /opt && \
  wget https://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-${STASH_VERSION}.tar.gz && \
  tar -xzvf atlassian-stash-${STASH_VERSION}.tar.gz && \
  rm atlassian-stash-${STASH_VERSION}.tar.gz && \
  mv atlassian-stash-${STASH_VERSION} stash && \
  apt-get update && \
  apt-get install -y git-core && \
  apt-get clean autoclean && \
  rm -rf /var/lib/{apt,cache,dpkg,log}

COPY ./scripts /opt/container/scripts
COPY ./templates /opt/container/templates

CMD ["/bin/sh", "/opt/container/scripts/stash.sh"]

