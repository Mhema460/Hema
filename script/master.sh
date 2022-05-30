sudo apt update -y
sudo apt install -y mc nano wget git curl
#install java JDK 8 and 11
sudo apt install openjdk-8-jre openjdk-8-jdk -y
sudo apt install fontconfig openjdk-11-jdk -y
#enable the Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
#start the Jenkins service
sudo systemctl start jenkins
#enable the Jenkins service to start on system boot
sudo systemctl enable jenkins
