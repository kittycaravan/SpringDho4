#!/bin/bash						
echo "Removing existing WAR file..."						
rm -f /home/ec2-user/app/dho4.war						
						
echo "Deploying WAR..."						
cp /home/ec2-user/app/dho4.war /opt/tomcat9/webapps/ROOT.war						
exit 0						
