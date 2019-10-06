
#!/bin/bash

. ~/.bashrc

if [ "$1" == "sync" ]
then
echo "Syncinc the configuration files between master and datanode"
scp /usr/local/hadoop/etc/hadoop/core-site.xml datanode1:/usr/local/hadoop/etc/hadoop
scp /usr/local/hadoop/etc/hadoop/mapred-site.xml datanode1:/usr/local/hadoop/etc/hadoop
scp /usr/local/hadoop/etc/hadoop/yarn-site.xml datanode1:/usr/local/hadoop/etc/hadoop

elif [ "$1" == "start" ]
then
echo "Starting up dfs, yarn, historyserver"
/usr/local/hadoop/sbin/start-dfs.sh
/usr/local/hadoop/sbin/start-yarn.sh
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver
elif [ "$1" == "stop" ]
then
echo "Stopping up dfs, yarn, historyserver"
/usr/local/hadoop/sbin/stop-dfs.sh
/usr/local/hadoop/sbin/stop-yarn.sh
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh stop historyserver
else
echo "Try with \"./cluster.sh [ sync, start, stop]\""
fi
