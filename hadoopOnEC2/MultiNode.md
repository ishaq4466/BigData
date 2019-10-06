Step 1: Installation of java,hadoop core [ same for master and slave node]

```
sudo apt-get update && sudo apt-get -y dist-upgrade

sudo apt-get install openjdk-8-jdk


curl -O http://mirrors.gigenet.com/apache/hadoop/common/hadoop-2.8.5/hadoop-2.8.5.tar.gz

tar -xvf hadoop-2.8.5.tar.gz

mv hadoop-2.8.5 hadoop
#mv hadoop-2.9.2 hadoop

sudo chown -R ubuntu hadoop

#setting  up variables

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.222.b10-0.47.amzn1.x86_64/jre/
export HADOOP_HOME=/home/$(whoami)/hadoop/
export HADOOP_CON_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
#  readlink -f 
#  "\[\033[01;32m\]\u@namenode\[\033[00m\]\$ "

. ~/.bashrc

# Setup $HADOOP_CON_DIR/hadoop-env.sh also
```



Step 2: Stop the ec2 instance and create AMI from that instance for datanode 

Step 3: Paste the coressponding config file and tweek the changes accordingly
```
curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/configfiles/core-site.xml
curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/configfiles/mapred-site.xml
curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/configfiles/yarn-site.xml

curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/configfiles/yarn-site.xml

curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/cluster.sh

# hdfs-site.xml will change for namenode and datanode rest all file will be same
curl -O https://raw.githubusercontent.com/ishaq4466/BigData/master/hadoopOnEC2/configfiles/hdfs-site.xml

```







Step