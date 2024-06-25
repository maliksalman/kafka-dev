# kafka-dev

This repository contains the Dockerfile and supporting files to create docker image which will run kafka and zookeeper in a single container. This can be really useful for development or experimentation. Don't try to use this for any production workloads. This configuration is NOT secure, resilient, or optimized for large message load (typical reasons why kafka is chosen).

The docker images built from this repository will be published to dockerhub at [https://hub.docker.com/r/maliksalman/kafka-dev](https://hub.docker.com/r/maliksalman/kafka-dev) and should be tagged matching [apache kafka](https://kafka.apache.org/downloads) release versions. The following versions of the images exist:

| Docker Image | JDK | Kafka Release | Includes Kafka-UI | Architecture |
| :------------| :--: | :------------ | :--: | :--: |
|  `maliksalman/kafka-dev:latest` | `21` | `3.7.0` | Yes | `amd64`, `arm64` |
|  `maliksalman/kafka-dev:3.7.0` | `21` | `3.7.0` | Yes | `amd64`, `arm64` |
|  `maliksalman/kafka-dev:3.4.0` | `17` | `3.4.0` | Yes | `amd64`, `arm64` |
|  `maliksalman/kafka-dev:3.2.0` | `17` | `3.2.0` | Yes | `amd64` |
|  `maliksalman/kafka-dev:3.0.0` | `11` | `3.0.0` | No | `amd64` |
|  `maliksalman/kafka-dev:2.4.1` | `8` | `2.4.1` | No | `amd64` |
|  `maliksalman/kafka-dev:1.1.0` | `8` | `1.1.0` | No | `amd64` |
|  `maliksalman/kafka-dev:1.0.0` | `8` | `1.0.0` | No | `amd64` |

## Running the container

To run a single broker kafka cluster, run the following docker command (works on `sh`, `bash`, `zsh`, etc):

```
docker run -d --rm --name kafka-dev \
	-e ADVERTISED_HOST=${HOSTNAME} \
	-e ENABLE_KAFKA_UI=true \
	--add-host=${HOSTNAME}:127.0.0.1 \
	-p 2181:2181 -p 9092:9092 -p 8080:8080 \
	maliksalman/kafka-dev:3.2.0
```

The above command will expose port `2181` as standard port for zookeeper, port `9092` where kafka broker will be listening, and port `8080` where kafka-ui (available since `3.2.0`) will be running. The command depends on `${HOSTNAME}` resolving properly, if running on an environment where that won't resolve to your docker host computer's name, then replace that with the hostname of where the docker host is running.
