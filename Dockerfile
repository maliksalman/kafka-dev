FROM bellsoft/liberica-openjdk-alpine:21

LABEL maintainer="smalik@pivotal.io"

WORKDIR /root/
ADD https://downloads.apache.org/kafka/3.7.0/kafka_2.13-3.7.0.tgz /root/
RUN tar xzf *.tgz; rm *.tgz; ln -s $(ls) kafka

ADD https://github.com/provectus/kafka-ui/releases/download/v0.7.2/kafka-ui-api-v0.7.2.jar /root/

ADD kafka-server-start.sh /root/
RUN chmod 755 kafka-server-start.sh

RUN apk update && apk add bash

ENV ENABLE_KAFKA_UI=false
ENV ADVERTISED_HOST=""

EXPOSE 9092 2181 8080
ENTRYPOINT /root/kafka-server-start.sh
