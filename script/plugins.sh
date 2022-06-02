## Installation of Git on Master
sudo apt install git
git --version
git init

## Ansible installation on the master
sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get install ansible -y
cd /etc/ansible 
ansible--version   

##Python installation on slave 
sudo apt update -y
sudo apt install python -y


## Install Apache Maven on master
cd /opt/
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz
sudo tar -xf apache-maven-3.8.5-bin.tar.gz
sudo mv apache-maven-3.8.5/ apache-maven/
sudo update-alternatives --install /usr/bin/mvn maven /opt/apache-maven/bin/mvn 1001

## Set Up Environment Variables M2_HOME and PATH 
sudo nano /etc/profile.d/mavenenv.sh
+export M2_HOME=/opt/maven
+export PATH=${M2_HOME}/bin:${PATH}
sudo chmod +x /etc/profile.d/mavenenv.sh
source /etc/profile.d/mavenenv.sh
mvn --version
