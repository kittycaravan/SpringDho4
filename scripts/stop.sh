#!/bin/bash
TOMCAT_DIR=/opt/tomcat9

echo "Stopping Tomcat..."
$TOMCAT_DIR/bin/shutdown.sh || true
sleep 5
rm -rf $TOMCAT_DIR/webapps/ROOT*
exit 0

