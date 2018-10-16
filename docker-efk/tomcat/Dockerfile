FROM tomcat:8.5.5-jre8
COPY conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY conf/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY webapps/sample.war /usr/local/tomcat/webapps/
EXPOSE 8080
WORKDIR /usr/local/tomcat
