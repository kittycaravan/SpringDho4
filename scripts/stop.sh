#!/bin/bash		
TOMCAT_DIR=/opt/tomcat9		
		
$TOMCAT_DIR/bin/shutdown.sh		
sleep 5		
rm -rf $TOMCAT_DIR/webapps/dho4*		
