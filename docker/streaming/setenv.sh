#!/bin/bash
alias notebook="jupyter notebook --ip='*'"

export PATH=/home/guest/spark/bin:home/guest/spark/sbin:home/guest/anaconda2/bin:$PATH

export SPARK_HOME=/home/guest/spark

export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.9-src.zip:$PYTHONPATH

export JAVA_HOME=/etc/alternatives/java_sdk
