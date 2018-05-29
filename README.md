# kafka-dev

This repository contains the Dockerfile and supporting files to create docker image which will run kafka and zookeeper in a single container. This can be really useful for development or experimentation. Don't try to use this for any production workloads. This configuration is not secure, resilient, or optimized for large message load (typical reasons why kafka is chosen).

The docker images built from this repository will be published to dockerhub at [https://hub.docker.com/r/maliksalman/kafka-dev](https://hub.docker.com/r/maliksalman/kafka-dev) and should be tagged matching [apache kafka](https://kafka.apache.org/downloads) release versions. The following versions of the images exist:

| Docker Image | Kafka Release |
| :------------| :------------ |
|  `maliksalman/kafka-dev:latest` | `1.1.0` |
|  `maliksalman/kafka-dev:1.1.0` | `1.1.0` |
|  `maliksalman/kafka-dev:1.0.0` | `1.0.0` |

## Running the container

To run a single broker kafka cluster, run the following docker command:

```
docker run -d --rm --name kafka \
	-e ADVERTISED_HOST={YOUR_DOCKER_HOSTNAME_GOES_HERE} \
	-p 2181:2181 -p 9092:9092 \
	maliksalman/kafka-dev
```

The above command will expose port `2181` as standard port for zookeeper and port `9092` where kafka broker will be listeneing. It is also important to note the need to set the `ADVERTISED_HOST` environment variable to your docker host's hostname otherwise the app connecting to zookeeper will not be given the correct address to the kafka broker.
