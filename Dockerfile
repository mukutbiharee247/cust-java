FROM ubuntu:16.04
RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install software-properties-common

#RUN mkdir /opt/java

#RUN mkdir /opt/jdk1.8.0_91

#ADD jdk1.8.0_91 /opt/jdk1.8.0_91/
#RUN ls -laR /opt/jdk1.8.0_91/bin/*

#RUN update-alternatives --install "/usr/bin/java" "java" "/opt/dk1.8.0_91/bin/java" 100

#ENV JAVA_HOME=/opt/dk1.8.0_91

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update

# Accept the license
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

RUN apt-get -y install oracle-java8-installer

RUN apt-get install oracle-java8-set-default

# Here comes the tomcat installation
#RUN apt-get -y install tomcat7
#RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/default/tomcat7
RUN mkdir /opt/tomcat9

ADD tomcat9 /opt/tomcat9

CMD /opt/tomcat9/bin/startup.sh && tail -f /opt/tomcat9/logs/catalina.out

# Expose the default tomcat port
EXPOSE 8080

# Start the tomcat (and leave it hanging)
#CMD service tomcat7 start && tail -f /var/lib/tomcat7/logs/catalina.out
