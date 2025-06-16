FROM tomcat:10.1-jdk21-openjdk
RUN rm -rf /usr/local/tomcat/webapps/*
RUN rm -rf /usr/local/tomcat/conf/server.xml
RUN rm -rf /usr/local/tomcat/conf/tomcat-users.xml
ADD infra-apache/tomcat-users.xml /usr/local/tomcat/conf/
ADD infra-apache/server.xml /usr/local/tomcat/conf/
COPY build/libs/websites-0.0.1.war /usr/local/tomcat/webapps/websites.war
EXPOSE 3000
CMD ["catalina.sh", "run"]