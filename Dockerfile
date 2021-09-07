FROM tomcat:8.0

LABEL maintainer="abhijitdd@yahoo.co.in"
ENV CONTEXT_ROOT="ci-demo"
ARG WAR=CI-Demo.war

ADD $WAR /usr/local/tomcat/webapps
RUN mv /usr/local/tomcat/webapps/${WAR} /usr/local/tomcat/webapps/${CONTEXT_ROOT}.war

EXPOSE 8080/tcp
