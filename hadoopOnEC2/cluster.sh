
#!/bin/bash

. ~/.bashrc

if [ "$1" == "sync" ]
then
echo "Syncinc the configuration files between master and datanode"
scp $HADOOP_CONF_DIR/core-site.xml datanode1:$HADOOP_CONF_DIR
scp $HADOOP_CONF_DIR/mapred-site.xml datanode1:$HADOOP_CONF_DIR
scp $HADOOP_CONF_DIR/yarn-site.xml datanode1:/usr/local/hadoop/etc/hadoop

elif [ "$1" == "start" ]
then
echo "Starting up dfs, yarn, historyserver"
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver
elif [ "$1" == "stop" ]
then
echo "Stopping up dfs, yarn, historyserver"
$HADOOP_HOME/sbin/stop-dfs.sh
$HADOOP_HOME/sbin/stop-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh stop historyserver
else
echo "Try with \"./cluster.sh [ sync, start, stop]\""
fi
