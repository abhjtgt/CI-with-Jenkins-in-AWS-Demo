FROM tomcat:8.0

LABEL maintainer="abhijitdd@yahoo.co.in"
ENV CONTEXT_ROOT="ci-demo"

ADD CI-Demo.war /usr/local/tomcat/webapps
RUN mv /usr/local/tomcat/webapps/CI-Demo.war /usr/local/tomcat/webapps/${CONTEXT_ROOT}.war

EXPOSE 8080/tcp
