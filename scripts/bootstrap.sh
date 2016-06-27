# install oracle jdk 8
if [ ! -f "/vagrant/resources/jdk-8u45-linux-x64.rpm" ]
then
	wget --no-cookies --no-check-certificate --progress=bar:force --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm"
	sudo cp jdk-8u45-linux-x64.rpm /vagrant/resources
fi

sudo rpm -ivh /vagrant/resources/jdk-8u45-linux-x64.rpm

# set java 8 as default (because we didn't remove the previous version)
sudo alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_45/jre/bin/java 20000
sudo alternatives --set java /usr/java/jdk1.8.0_45/jre/bin/java

# install kafka 0.8.2.2
sudo wget --progress=bar:force http://apache.mirrors.tds.net/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz
sudo tar -zxf kafka_2.10-0.8.2.2.tgz

sudo chown -R vagrant:vagrant kafka_2.10-0.8.2.2.tgz
sudo chown -R vagrant:vagrant kafka_2.10-0.8.2.2

# install python pip
sudo yum -y install python-pip

# upgrade pip
sudo pip install --upgrade pip

# install python kafka client
sudo pip install kafka-python

# copy server.properties to config directory
cp /vagrant/resources/server.properties /home/vagrant/kafka_2.10-0.8.2.2/config
sudo chown -R vagrant:vagrant kafka_2.10-0.8.2.2/config/server.properties

# make scripts executable
sudo chmod +x /vagrant/scripts/*.sh
