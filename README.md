# Apache Kafka 0.8.2.2

## 1. Introduction

Vagrant project to spin up a single broker Kafka cluster. 

## 2. Prerequisites

1. At least 1GB memory in addition to the memory for your host machine.
2. Vagrant 1.7 or higher.
3. VirtualBox 4.3.2 or higher.

## 3. Spinning Up a VM

1. Download and install VirtualBox.
2. Download and install Vagrant.
3. Check out this project from svn, and change directory into this project directory.
4. Run `vagrant up` to create the VM.
5. Run `vagrant ssh` to get into your VM.
6. Run `vagrant destroy` when you want to destroy and get rid of the VM.

## 4. Starting the Server

The following commands will start both Kafka server and ZooKeeper.

```
$ cd /opt/kafka
$ ./bin/zookeeper-server-start.sh config/zookeeper.properties &
$ ./bin/kafka-server-start.sh config/server.properties &
```

## 5. Testing

### IP and Port

The configured Kafka broker binds to IP 192.168.200.20 and listens on port 9092.

ZooKeeper listens on port 2181.

### Topic

First, create a test topic named `my-topic`.

```
$ cd /opt/kafka
$ ./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic my-topic
```

### Consumer

Open up a new terminal window, SSH into the Kafka VM, run a simple consumer. 

```
$ cd /opt/kafka
$ ./bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic my-topic
```

### Producer

Open up a new terminal window, SSH into the Kafka VM, run a simple producer.

```
$ cd /opt/kafka
$ ./bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-topic
```

If you type a few message into the producer window, you will see the same message showing up in the consumer window.

## 6. Note

- The base box for CentOS 6.4 will be downloaded from http://wdev.qa.admarketplace.net.
- If you run `vagrant up` for the very first time, Oracle JDK 8 and Kafka 0.8.2.2 will be automatically downloaded and installed, and copied to the `/resources` directory. Next time, when you run `vagrant up`, the files in the `/resources` directory will be used instead, which will make the boot-up time fast. In the future, these files will be included as part of the base box.
- This uses Oracle JDK 8.
- This comes with Python 2.6.x.

## 7. Known Issues

### Property topic is not valid

This warning message shows up when you run the console producer script. It seems that this has been fixed in version 0.9.0.0. For more information, please refer to https://issues.apache.org/jira/browse/KAFKA-1711.

```
WARN Property topic is not valid (kafka.utils.VerifiableProperties)
```

### No handlers could be found for logger "kafka.conn"

This warning message shows up only when running Kafka client on a CentOS box - didn't see it on a Ubuntu box.

```
No handlers could be found for logger "kafka.conn"
```
