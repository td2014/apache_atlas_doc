Quick Start
===========

This section will provide a basic walkthrough to get you started with Atlas.  Note that portions of the content here is derived from the official Atlas documentation at http://atlas.apache.org/Bridge-Hive.html, and the Hive documentation at https://cwiki.apache.org/confluence/display/Hive/GettingStarted.

We will create a basic hook setup for capturing Hive events by the Atlas server.  We assume that you already have Hadoop, Hive, and Atlas running on your system.

Step 1.  Tell Hive about Atlas.
-------------------------------
1a) Add the below lines to hive-site.xml of your Hive installation::

  <property>
    <name>hive.exec.post.hooks</name>
    <value>org.apache.atlas.hive.hook.HiveHook</value>
  </property>
  <property>
    <name>atlas.cluster.name</name>
    <value>primary</value>
  </property>

1b) Add the below to hive-env.sh of your Hive installation.  (Note that <atlas package> refers
to the directory of the Atlas package you generated in the installation/build process)::

  export HIVE_AUX_JARS_PATH=<atlas package>/hook/hive

1c) Copy <atlas-conf>/atlas-application.properties to the conf directory of your Hive installation.  <atlas-conf> is the conf directory in your <atlas package>.

1d) Start your Hadoop instance (the below assumes a new starting state for Hadoop)::

  $HADOOP_HOME/bin/hdfs namenode -format -force
  $HADOOP_HOME/sbin/start-dfs.sh

1e) Start your Atlas instance (The first two export lines may be necessary for a local Atlas setup, $ATLAS_HOME is the same as <atlas package> above)::

  export MANAGE_LOCAL_HBASE=true
  export MANAGE_LOCAL_SOLR=true
  $ATLAS_HOME/bin/atlas_start.py

Step 2.  Add some data to Hive and confirm capture by Atlas.
------------------------------------------------------------
The following tutorial is useful for quickly getting some information into Hive and seeing the results in Atlas:

https://community.hortonworks.com/articles/36121/using-apache-atlas-to-view-data-lineage.html


