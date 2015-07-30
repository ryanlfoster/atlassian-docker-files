FROM handcraftedbits/oraclejdk-8:latest
MAINTAINER HandcraftedBits <opensource@handcraftedbits.com>

ENV BAMBOO_HOME /opt/data/bamboo
ENV BAMBOO_VERSION 5.9.2
ENV MAVEN_VERSION 3.3.3
ENV PATH $PATH:/opt/maven/bin

VOLUME /opt/data/bamboo
VOLUME /opt/data/maven

EXPOSE 8085

RUN cd /opt && \
  wget https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz && \
  tar -xzvf atlassian-bamboo-${BAMBOO_VERSION}.tar.gz && \
  rm atlassian-bamboo-${BAMBOO_VERSION}.tar.gz && \
  mv atlassian-bamboo-${BAMBOO_VERSION} bamboo && \
  wget http://apache.mirrors.pair.com/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
  tar -xzvf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
  rm apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
  mv apache-maven-${MAVEN_VERSION} maven

COPY ./scripts /opt/container/scripts
COPY ./templates /opt/container/templates

CMD ["/bin/sh", "/opt/container/scripts/bamboo.sh"]
