#!/bin/bash

# start zookeeper in background
kafka/bin/zookeeper-server-start.sh kafka/config/zookeeper.properties > zookeeper.log 2> zookeeper.log &

# start the UI in background
if [[ "${ENABLE_KAFKA_UI}" == "true" ]]; then
	KAFKA_CLUSTERS_0_NAME=local KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=localhost:9092 java -jar /root/kafka-ui-*.jar > kafka-ui.log 2> kafka-ui.log &
fi

# modify the advertised.listeners property in kafka server.properties
if [[ ! -z "$ADVERTISED_HOST" ]]; then
	echo >> kafka/config/server.properties
	echo "advertised.listeners=PLAINTEXT://$ADVERTISED_HOST:9092" >> kafka/config/server.properties
fi

# start the kafka server
kafka/bin/kafka-server-start.sh kafka/config/server.properties
