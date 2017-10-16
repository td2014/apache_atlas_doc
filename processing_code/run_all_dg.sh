#!/bin/bash
#
# Script to start all of the
# data governance related applications.
#
#

# Error trap
if [ $# == 0 ]
then
   echo 'Usage:  run_all_dg.sh start|stop'
   exit
fi

if [ $# -gt 1 ]
then
   echo 'Error.  Only a single argument is allowed.'
   exit
fi

# set environment variables

export HADOOP_HOME=/Users/anthonydaniell/Desktop/FilesToStay/Development/DataGovernance/hadoop-2.7.4
export HIVE_HOME=/Users/anthonydaniell/Desktop/FilesToStay/Development/DataGovernance/apache-hive-2.1.1-bin

export PATH=$HIVE_HOME/bin:$PATH

# If we are starting up, use first branch

if [ $1 == 'start' ]
then
# Hadoop
    echo 'Starting Hadoop.'
    $HADOOP_HOME/sbin/start-dfs.sh

# Hive

# Atlas

elif [ $1  == 'stop' ]
then

# Atlas

# Hive

# Hadoop
    echo 'Stopping Hadoop.'
    $HADOOP_HOME/sbin/stop-dfs.sh

else

   echo 'Error.  Argument must be either start or stop.'

fi

#
# End of script
#
