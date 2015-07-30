#!/bin/sh

# Fix up configuration files

if [ -z "$PROXY_HOST" ]
then
     PROXY_HOST=localhost
fi

sed -e "s/\${PROXY_HOST}/$PROXY_HOST/g" \
     /opt/container/templates/opt/bamboo/conf/server.xml.template > /opt/bamboo/conf/server.xml

# Import server certificate

echo "changeit\nyes" | keytool -import -trustcacerts -alias root -file /opt/data/certs/server.crt \
     -keystore $JAVA_HOME/jre/lib/security/cacerts

# Run Bamboo

/opt/bamboo/bin/start-bamboo.sh -fg
