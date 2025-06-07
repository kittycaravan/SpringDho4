#!/bin/bash
echo "Deploying WAR..."
cp /home/ec2-user/app/*.war /opt/tomcat9/webapps/ROOT.war
exit 0
