#!/bin/bash

service sshd start
service cassandra start

#su guest ./kafka/bin/zookeeper-server-start.sh $HOME/kafka/config/zookeeper.properties  > /home/guest/zookeeper.log 2>&1 &
#su guest ./kafka/bin/kafka-server-start.sh $HOME/kafka/config/server.properties > /home/guest/kafka.log 2>&1 &
