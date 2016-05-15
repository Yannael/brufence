FROM centos:centos6

RUN yum -y update;
RUN yum -y clean all;

# Install basic tools
RUN yum install -y  wget dialog curl sudo lsof vim axel telnet nano openssh-server bzip2 passwd tar

#Install Java
RUN yum install -y java-1.7.0-openjdk-1.7.0.85 java-1.7.0-openjdk-devel-1.7.0.85 

#Create guest user
RUN useradd guest -u 1000
RUN echo guest | passwd guest --stdin

ENV HOME /home/guest
WORKDIR $HOME

USER guest

#Install Spark
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.1-bin-hadoop2.6.tgz
RUN tar xvzf spark-1.6.1-bin-hadoop2.6.tgz
RUN mv spark-1.6.1-bin-hadoop2.6 spark
ENV SPARK_HOME $HOME/spark

#Install Kafka
RUN wget http://apache.belnet.be/kafka/0.9.0.0/kafka_2.10-0.9.0.0.tgz
RUN tar xvzf kafka_2.10-0.9.0.0.tgz
RUN mv kafka_2.10-0.9.0.0 kafka

ENV PATH $HOME/spark/bin:$HOME/spark/sbin:$HOME/kafka/bin:$PATH

#Install Anaconda Python distribution
RUN wget http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh
RUN bash Anaconda2-4.0.0-Linux-x86_64.sh -b
ENV PATH $HOME/anaconda2/bin:$PATH

#Install Jupyer notebook + Toree Scala kernel
RUN conda install jupyter -y 
RUN pip install --pre toree
RUN jupyter toree install --user

#Install Kafka Python module
#RUN pip install kafka-python

USER root

#Startup (start SSH, Cassandra, Zookeeper, Kafka producer)
ADD startup_script.sh /usr/bin/startup_script.sh
RUN chmod +x /usr/bin/startup_script.sh

#Environment variables for Spark and Java
ADD setenv.sh /home/guest/setenv.sh
RUN chown guest:guest setenv.sh
RUN echo . ./setenv.sh >> .bashrc

#Spark defaults to add jars
ADD spark-defaults.conf /home/guest/spark/conf/spark-defaults.conf
RUN chown guest:guest /home/guest/spark/conf/spark-defaults.conf

#Install Cassandra
ADD datastax.repo /etc/yum.repos.d/datastax.repo
RUN yum install -y dsc21-2.1.7-1  cassandra2.1.7-1 cassandra21-tools-2.1.7-1
RUN echo "/usr/lib/python2.7/site-packages" |tee /home/guest/anaconda2/lib/python2.7/site-packages/cqlshlib.pth

