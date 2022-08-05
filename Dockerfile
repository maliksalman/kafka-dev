FROM eclipse-temurin:17-jdk-alpine

LABEL maintainer="smalik@pivotal.io"

RUN apk update && apk add --no-cache bash

WORKDIR /root/
ADD http://ftp.wayne.edu/apache/kafka/3.2.0/kafka_2.13-3.2.0.tgz /root/
RUN tar xzf *.tgz; rm *.tgz; ln -s $(ls) kafka

ADD https://github.com/provectus/kafka-ui/releases/download/v0.4.0/kafka-ui-api-v0.4.0.jar /root/

ADD kafka-server-start.sh /root/
RUN chmod 755 kafka-server-start.sh

ENV ENABLE_KAFKA_UI=false
ENV ADVERTISED_HOST=""

EXPOSE 9092 2181 8080
ENTRYPOINT /root/kafka-server-start.sh
