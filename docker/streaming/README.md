# Docker container for Kafka - Spark streaming - Cassandra

This Dockerfile installs

* Kafka 0.9.0.0
* Spark 1.6.1 for Scala 2.10 or 2.11
* Cassandra 2.1.7

It additionnally installs

* Anaconda 2.4 Python distribution 
* Jupyter notebook for Python and Scala (Toree)

# Quick start-up guide

## Build

From Dockerfile folder, run

```
docker build -t streaming .
```

## Run

```
docker run -v /path/to/brufence:/home/guest/brufence -p 4050:4040 -p 18090:18080 -p 8888:8888 -p 23:22 -ti --privileged streaming
```

Replace '/path/to/brufence' with the folder where this repo is cloned.

## Start services

Once run, you are logged in as root in the container. Run the startup_script.sh to start

* SSH server. You can connect to the container using user 'guest' and password 'guest'
* Cassandra
* Zookeeper server
* Kafka server

## Open notebook and start streaming

Connect as user 'guest'

```
su guest
```

Start Jupyter notebook

```
notebook
```

and connect from your browser at port 8888

### Start Kafka producer

Open 

### Start Kafka receiver

Open

# Container configuration details

The container is based on CentOS 6 Linux distribution. The main steps of the building process are

* Install some common Linux tools (wget, unzip, tar, ssh tools, ...), and Java 
* Create a guest user (UID important for sharing folders with host!, see below), and install Spark and sbt, Kafka, Anaconda and Jupyter notbooks for the guest user
* Go back to root user, and install startup script (for starting SSH and Cassandra services), sentenv.sh secript to set up environment variables (JAVA, Kafka, Spark, ...), spark-default.conf, and Cassandra 

## User UID

In the Dockerfile, the line

````
RUN useradd guest -u 1000
```

creates the user under which the container will be run as a guest user. The username is 'guest', with password 'guest', and the '-u' parameter sets the linux UID for that user.

In order to make sharing of folders easier between the container and your host, **make sure this UID matches your user UID on the host**. You can see what your host UID is with

```
echo $UID
```



