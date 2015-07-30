FROM handcraftedbits/oraclejdk-8:latest
MAINTAINER HandcraftedBits <opensource@handcraftedbits.com>

ENV JIRA_HOME /opt/data/jira
ENV JIRA_VERSION 6.4.8

VOLUME /opt/data/jira

EXPOSE 8080

RUN cd /opt && \
  wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz && \
  tar -xzvf atlassian-jira-${JIRA_VERSION}.tar.gz && \
  rm atlassian-jira-${JIRA_VERSION}.tar.gz && \
  mv atlassian-jira-${JIRA_VERSION}-standalone jira

COPY ./scripts /opt/container/scripts
COPY ./templates /opt/container/templates

CMD ["/bin/sh", "/opt/container/scripts/jira.sh"]
