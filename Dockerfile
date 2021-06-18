FROM 211281473498.dkr.ecr.ap-south-1.amazonaws.com/tomcat:9.0.48
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
