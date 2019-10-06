	
"CentOS Linux 7 (Core)"

```
sudo yum install java-1.8.0-openjdk -y

curl -O http://mirrors.gigenet.com/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz

tar -xvf hadoop-2.8.5.tar.gz

mv hadoop-2.9.2.tar.gz

set up .bashrc

readlink -f 

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
  <property>
    <name>dfs.namenode.name.dir</name>
    <value>file:///usr/local/hadoop/data/hdfs/namenode</value>
  </property>
</configuration>


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


hdfs namenode -format

start-dfs.sh
start-yarn.sh
mr-jobhistory-daemon.sh start historyserver


curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/sample.txt
hdfs dfs -mkdir -p /user/hadoop/

hdfs dfs -put sample.txt sample.txt

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar wordcount sample sample_wordmean_output

```
