"# MySqlDocker" 
version: '3'

## docker run --rm -it -v ${PWD}:/tutorial --net=host landoop/fast-data-dev:cp3.3.0 bash

services:
  redis:
    image: redis
    command: redis-server --requirepass Redis2019!
    ports:
      - "6379:6379"
      - 
    ############################# ZOOKEEPER #################################
    zookeeper:  
        hostname: zookeeper
        container_name: zookeeper
        image: 'bitnami/zookeeper:latest'
        networks: 
            - zookeeper-network
        environment:
            - ALLOW_ANONYMOUS_LOGIN=yes
            - ZOOKEEPER_CLIENT_PORT=2181
            - ZOOKEEPER_TICK_TIME=2000

    ############################# KAFKA #####################################                
    kafka:
        image: confluentinc/cp-kafka:latest
        networks: 
            - zookeeper-network
        depends_on:
            - zookeeper
        ports:
            - 9092:9092
        environment:
            KAFKA_BROKER_ID: 1
            KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
            KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:29092,PLAINTEXT_HOST://localhost:9092
            KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT
            KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
            KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
