	
# Setup on "CentOS Linux 7 (Core) or Ubuntu 16.04"

Step 1: Installation of java,hadoop core


```
sudo apt-get update && sudo apt-get -y dist-upgrade

#sudo yum install java-1.8.0-openjdk -y

sudo apt-get install openjdk-8-jdk

#sudo alternatives --config java

curl -O http://mirrors.gigenet.com/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz

tar -xvf hadoop-2.8.5.tar.gz

mv hadoop-2.9.2.tar.gz hadoop

#setting  up variables

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.47.amzn1.x86_64/jre/
export HADOOP_HOME=/home/ec2-user/hadoop/
export HADOOP_CON_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
#  readlink -f 
# \[\033[01;32m\]\u@namenode\[\033[00m\]$

. ~/.bashrc

```

Step 2: Setting up hadoop core

```
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

</configuration>

# mv $HADOOP_CON_DIR/mapred-site.xml.template $HADOOP_CON_DIR/mapred-site.xml

chmod +x cluster.sh

```

Step 3. Setting passwordless ssh

```
ssh-keygen

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

/etc/hosts
13.126.192.239 masternode

ssh masternode

hdfs namenode -format

./cluster.sh start 

hdfs dfsadmin -report 

hdfs dfs -mkdir -p /user/ec2-user/

curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/sample.txt

hdfs dfs -put sample.txt sample.txt

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar wordcount sample.txt sample_wordmean_output
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar wordmean sample.txt sample_wordmean_output

./cluster.sh stop

Troubleshooting commands :
hdfs dfsadmin -report 
hdfs dfsadmin -safemode leave
```

* ports to remember 8088,50070,50090,9000
