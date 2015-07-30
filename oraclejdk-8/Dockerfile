FROM ubuntu:latest
MAINTAINER HandcraftedBits <opensource@handcraftedbits.com>

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer oracle-java8-set-default && \
  apt-get autoremove -y --purge software-properties-common && \
  apt-get upgrade -y && \
  apt-get clean autoclean && \
  rm -rf /var/lib/{apt,cache,dpkg,log}
