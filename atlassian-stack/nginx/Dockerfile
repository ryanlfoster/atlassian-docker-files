FROM nginx:latest
MAINTAINER HandcraftedBits <opensource@handcraftedbits.com>

VOLUME /opt/data/certs

COPY ./scripts /opt/container/scripts
COPY ./templates /opt/container/templates

CMD ["/bin/sh", "/opt/container/scripts/nginx.sh"]
