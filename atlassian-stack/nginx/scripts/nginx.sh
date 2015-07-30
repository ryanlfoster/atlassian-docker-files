#!/bin/sh

# Fix up configuration files

if [ -z "$PROXY_HOST" ]
then
     PROXY_HOST=localhost
fi

sed -e "s/\${PROXY_HOST}/$PROXY_HOST/g" \
     /opt/container/templates/etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Run nginx

nginx -g "daemon off;"
