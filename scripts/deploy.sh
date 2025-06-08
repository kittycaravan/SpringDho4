#!/bin/bash		
		
TOMCAT_DIR=/opt/tomcat9		
WAR_SRC=/home/ec2-user/app/dho4.war		
WAR_DEST=$TOMCAT_DIR/webapps/ROOT.war		
		
echo "Deploying WAR with mv..."		
mv $WAR_SRC $WAR_DEST		
		
exit 0		
