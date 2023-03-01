FROM eclipse-temurin:17-jdk

LABEL maintainer="smalik@pivotal.io"

WORKDIR /root/
ADD https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz /root/
RUN tar xzf *.tgz; rm *.tgz; ln -s $(ls) kafka

ADD https://github.com/provectus/kafka-ui/releases/download/v0.5.0/kafka-ui-api-v0.5.0.jar /root/

ADD kafka-server-start.sh /root/
RUN chmod 755 kafka-server-start.sh

ENV ENABLE_KAFKA_UI=false
ENV ADVERTISED_HOST=""

EXPOSE 9092 2181 8080
ENTRYPOINT /root/kafka-server-start.sh
