provider "google" {
  project     = "helical-song-350207"
  region      = "europe-west1"
}
resource "google_compute_firewall" "tcp-firewall-rule-8080" {
  name = "tcp-firewall-rule-8080-22-9070"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["8080", "22", "9070"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "jenkins-master-new1" {
  name         = "jenkins-master-new1"
  machine_type = "n2-standard-4"
  zone         = "europe-west1-d"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
      network = "default"
      access_config {
		 
    }
  }
# Bootstrapping Script to Install Apache
metadata_startup_script = <<EOF
apt-get update -y;
apt-get install -y mc nano wget git curl;
#install java JDK 8 and 11
apt-get install openjdk-8-jre openjdk-8-jdk -y;
apt-get install fontconfig openjdk-11-jdk -y;
#enable the Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null;
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null;
sudo apt-get update;
sudo apt-get install jenkins;
#start the Jenkins service
systemctl start jenkins;
#enable the Jenkins service to start on system boot
systemctl enable jenkins;
#load the environment variables
key=`cat /var/lib/jenkins/secrets/initialAdminPassword`
response=""
while [ `echo $$response | grep 'Authenticated' | wc -l` = 0 ]; do
  echo "Jenkins not started, wait for 2s"
  response=`java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s \
  http://localhost:8080 who-am-i --username admin --password $$key`
  echo $$response
  sleep 2
done
java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s \
http://localhost:8080/ -auth admin:$$key -noKeyAuth install-plugin \
dashboard-view cloudbees-folder antisamy-markup-formatter build-name-setter build-timeout config-file-provider \
credentials-binding embeddable-build-status rebuild ssh-agent throttle-concurrents timestamper ws-cleanup ant gradle \
msbuild nodejs checkstyle cobertura htmlpublisher junit warnings xunit workflow-aggregator github-organization-folder \
pipeline-stage-view build-pipeline-plugin conditional-buildstep jenkins-multijob-plugin parameterized-trigger \
copyartifact bitbucket clearcase cvs git git-parameter github gitlab-plugin p4 repo subversion teamconcert tfs \
matrix-project ssh-slaves windows-slaves matrix-auth pam-auth ldap role-strategy active-directory email-ext \
emailext-template mailer publish-over-ssh ssh -restart;



EOF
 
}
