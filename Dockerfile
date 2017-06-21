FROM centos:7
LABEL maintainer="playniuniu@gmail.com"

ENV ORACLE_SERVER_JRE8_URL="http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/server-jre-8u131-linux-x64.tar.gz" \
    JAVA_HOME=/opt/jre \
    JAVA=/opt/jre/bin \
    PATH=${PATH}:/opt/jre/bin

RUN yum install curl unzip -y \
    && cd /tmp \
    && curl -jk#SLH "Cookie: oraclelicense=accept-securebackup-cookie" -o jre.tar.gz ${ORACLE_SERVER_JRE8_URL} \
    && mkdir ${JAVA_HOME} \
    && tar xzf /tmp/jre.tar.gz -C /opt/jre --strip-components=1 \
    && rm -rf /tmp/*

CMD ["/bin/bash"]
