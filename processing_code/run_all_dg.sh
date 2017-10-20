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
export ATLAS_HOME=/Users/anthonydaniell/Desktop/FilesToStay/Development/DataGovernance/atlas/distro/target/apache-atlas-0.9-SNAPSHOT-bin/apache-atlas-0.9-SNAPSHOT

export PATH=$HIVE_HOME/bin:$PATH

# If we are starting up, use first branch

if [ $1 == 'start' ]
then
# Hadoop.  
# Note you need to do a rm -rf /tmp/hadoop-anthonydaniell to clean up otherwise the datanode does not start correctly.

    echo 'Starting Hadoop.'
    $HADOOP_HOME/bin/hdfs namenode -format -force
    $HADOOP_HOME/sbin/start-dfs.sh

# Hive - uncomment schematool to create metadata store.
# Note you need to remove derby.log and metastore_db for clean up restart, then reinitialize using the schematool routine below.

    $HIVE_HOME/bin/schematool -dbType derby -initSchema
    $HADOOP_HOME/bin/hadoop fs -mkdir       /tmp
    $HADOOP_HOME/bin/hadoop fs -mkdir       /user
    $HADOOP_HOME/bin/hadoop fs -mkdir       /user/hive
    $HADOOP_HOME/bin/hadoop fs -mkdir       /user/hive/warehouse
    $HADOOP_HOME/bin/hadoop fs -chmod g+w   /tmp
    $HADOOP_HOME/bin/hadoop fs -chmod g+w   /user/hive/warehouse

# Atlas
###    $ATLAS_HOME/bin/atlas_start.py
elif [ $1  == 'stop' ]
then

# Atlas
###    $ATLAS_HOME/bin/atlas_stop.py
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
