	
"CentOS Linux 7 (Core)"

```
Step 1: Installation of java,hadoop core and configuring bashrc

sudo yum install java-1.8.0-openjdk -y

sudo alternatives --config java

curl -O http://mirrors.gigenet.com/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz

tar -xvf hadoop-2.8.5.tar.gz

mv hadoop-2.9.2.tar.gz hadoop

#setting  up .bashrc

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.47.amzn1.x86_64/jre/
export HADOOP_HOME=/home/ec2-user/hadoop/
export HADOOP_CON_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
#readlink -f 

. ~/.bashrc

/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-1.el7_7.x86_64/jre


<!-- Site specific core-site configuration properties -->
<configuration>
<property>
 <name>fs.defaultFS</name>
 <value>hdfs://localhost:9000</value>
</property>
</configuration>



<!-- Site specific HDFS configuration properties -->

<configuration>
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
<!--   <property>
    <name>dfs.namenode.name.dir</name>
    <value>file:///usr/local/hadoop/data/hdfs/namenode</value>
  </property>
 -->
 </configuration>

vim $HADOOP_CON_DIR/yarn-site.xml
<!-- Site specific YARN configuration properties -->

<configuration>

  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>localhost</value>
  </property>

</configuration>


mv $HADOOP_CON_DIR/mapred-site.xml.template $HADOOP_CON_DIR/mapred-site.xml
<!-- Site specific mapred configuration properties -->
<configuration>
  <property>
    <name>mapreduce.jobtracker.address</name>
    <value>localhost:54311</value>
  </property>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
</configuration>



cat >> ~/cluster.sh << EOF

#!/bin/bash

. ~/.bashrc

if [ "$1" == "start" ]
then
start-dfs.sh
start-yarn.sh
mr-jobhistory-daemon.sh start historyserver
elif [ "$1" == "stop" ]
then
stop-dfs.sh
stop-yarn.sh
mr-jobhistory-daemon.sh stop historyserver
else
echo "Try with \"./cluster.sh [ start, stop ]\" "
fi

EOF

chmod +x ~/cluster.sh

Setting passwordless ssh
ssh-keygen

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

/etc/hosts
13.126.192.239 masternode

ssh masternode

curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/sample.txt

hdfs namenode -format

./cluster.sh start 

hdfs dfsadmin -report 

hdfs dfs -mkdir -p /user/ec2-user/

hdfs dfs -put sample.txt sample.txt

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar wordcount sample.txt sample_wordmean_output
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar wordmean sample.txt sample_wordmean_output


```
