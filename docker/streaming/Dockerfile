FROM centos:centos6

RUN yum -y update;
RUN yum -y clean all;

# Installing necessary tools
RUN yum install -y java-1.7.0-openjdk wget dialog curl sudo lsof vim axel telnet java-1.7.0-openjdk java-1.7.0-openjdk-devel nano openssh-server

RUN  useradd guest
RUN echo guest | passwd guest --stdin

ENV HOME /home/guest
WORKDIR $HOME

USER guest
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.1-bin-hadoop2.6.tgz
RUN tar xvzf spark-1.6.1-bin-hadoop2.6.tgz
RUN mv spark-1.6.1-bin-hadoop2.6 spark

RUN wget http://apache.belnet.be/kafka/0.9.0.0/kafka_2.10-0.9.0.0.tgz
RUN tar xvzf kafka_2.10-0.9.0.0.tgz
RUN mv kafka_2.10-0.9.0.0 kafka

ENV PATH $HOME/spark/bin:$HOME/spark/sbin:$HOME/kafka/bin:$PATH
ENV SPARK_HOME $HOME/spark

RUN wget http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh
RUN bash Anaconda2-4.0.0-Linux-x86_64.sh -b
ENV PATH $HOME/anaconda2/bin:$PATH
RUN conda install jupyter -y 

RUN pip install --pre toree
RUN jupyter toree install --user

RUN pip install kafka-python

USER root

ADD startup_script.sh /usr/bin/startup_script.sh
RUN chmod +x /usr/bin/startup_script.sh

ADD setenv.sh /home/guest/setenv.sh
RUN chown guest:guest setenv.sh
RUN echo . ./setenv.sh >> .bashrc

ADD spark-defaults.conf /home/guest/spark/conf/spark-defaults.conf
RUN chown guest:guest /home/guest/spark/conf/spark-defaults.conf

