FROM centos:latest
MAINTAINER playniuniu@gmail.com

ENV ORACLE_SERVER_JRE8_URL="http://download.oracle.com/otn-pub/java/jdk/8u112-b15/server-jre-8u112-linux-x64.tar.gz" \
    JAVA_HOME=/opt/jre \
    JAVA=/opt/jre/bin \
    PATH=${PATH}:/opt/jre/bin

RUN yum install curl -y \
    && mkdir ~/downloads/ \
    && cd ~/downloads/ \
    && curl -jk#SLH "Cookie: oraclelicense=accept-securebackup-cookie" -o jre.tar.gz ${ORACLE_SERVER_JRE8_URL} \
    && mkdir /opt/jre \
    && tar xzf ~/downloads/jre.tar.gz -C /opt/jre --strip-components=1 \
    && rm -rf ~/downloads/

CMD ["/bin/bash"]
