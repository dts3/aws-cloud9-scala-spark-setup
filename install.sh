echo "-----------------------------------------------"
echo "###  Installing updates...                    ###"
echo "-----------------------------------------------"
sudo yum -y update
echo "-----------------------------------------------"
echo "###  Installing Scala...                    ###"
echo "-----------------------------------------------"
wget https://downloads.lightbend.com/scala/2.12.11/scala-2.12.11.tgz
tar xvf scala-2.12.11.tgz
rm https://downloads.lightbend.com/scala/2.12.4/scala-2.12.11.tgz
mv scala-2.12.11 ~/scala-2.12.11
echo SCALA_HOME="$HOME/scala-2.12.11" >> ~/.bash_profile
echo PATH=\"\$PATH:\$SCALA_HOME/bin\" >> ~/.bash_profile
echo "Done."
echo "-----------------------------------------------"
echo "###  Installing Java 1.8...                 ###"
echo "-----------------------------------------------"
sudo yum install -y java-1.8.0-openjdk-devel

echo "-----------------------------------------------"
echo "###  Please choose Java 1.8 from the list   ###"
echo "-----------------------------------------------"
sudo /usr/sbin/alternatives --config javac
sudo /usr/sbin/alternatives --config java
echo "Java Done."

echo "-----------------------------------------------"
echo "###  Installing SBT...                      ###"
echo "-----------------------------------------------"
curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
sudo yum install -y sbt
echo "Done."

echo "-----------------------------------------------"
echo "###  Installing Spark 3...                    ###"
echo "-----------------------------------------------"
wget http://www.trieuvan.com/apache/spark/spark-3.0.0/spark-3.0.0-bin-hadoop3.2.tgz
tar xvf spark-3.0.0-bin-hadoop3.2.tgz
rm spark-3.0.0-bin-hadoop3.2.tgz
mv spark-3.0.0-bin-hadoop3.2 ~/spark-3.0.0-bin-hadoop3.2
echo SPARK_HOME="$HOME/spark-3.0.0-bin-hadoop3.2" >> ~/.bash_profile
echo PATH=\"\$PATH:\$SPARK_HOME/bin\" >> ~/.bash_profile

echo export PATH >> ~/.bash_profile
echo "-----------------------------------------------"
echo "###  Installing python and pip...                    ###"
echo "-----------------------------------------------"
sudo yum install -y python3-pip
sudo pip3 install py4j
sudo pip3 install findspark
echo "-----------------------------------------------"
echo "###  Enabling Scala Runner...               ###"
echo "-----------------------------------------------"
sh Enable\ Scala\ Runner.sh

echo "All Done."
echo "Please restart all terminal sessions."
