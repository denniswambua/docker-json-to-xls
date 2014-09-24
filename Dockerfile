FROM ubuntu:14.04
MAINTAINER Dennis Wambua <dwambua@ona.io>
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk openjdk-7-jre gradle postgresql git-core
WORKDIR /opt
RUN git clone  https://github.com/onaio/json-to-xls
WORKDIR /opt/json-to-xls
RUN gradle distZip
WORKDIR /opt/json-to-xls/build/distributions/
RUN unzip json-to-xls-1.0-SNAPSHOT.zip
WORKDIR /opt/json-to-xls/build/distributions/json-to-xls-1.0-SNAPSHOT/
RUN cp /opt/json-to-xls/api.txt .

ADD start /start
RUN chmod 0755 /start
EXPOSE 8080

CMD ["/start"]

