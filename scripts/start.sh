#!/bin/bash
WAR_FILE=/home/ec2-user/app/dho4.war
TOMCAT_DIR=/opt/tomcat9

cp $WAR_FILE $TOMCAT_DIR/webapps/
$TOMCAT_DIR/bin/startup.sh
