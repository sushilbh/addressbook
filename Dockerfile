FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY addressbook_main/target/*.war /home/ec2-user/tomcat/webapps/
