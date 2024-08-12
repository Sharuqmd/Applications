Install terraform

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform -y

Install awscli

apt install unzip -y 

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

Install jenkins

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

sudo apt install fontconfig openjdk-17-jre -y 

sudo systemctl enable jenkins

sudo systemctl start jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword
install plugins and configure global credentials and tools 
m3
aws cred
docker cred
docker plugin
aws plugin
sonar scanner







Install docker 

sudo apt install docker.io -y

usermod -aG docker jenkins 

sudo systemctl restart jenkins

aws configure 

Docker password configure in jenkins 

Install kubectl

curl -LO "https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

Install python and pip

sudo apt install python3.12-venv -y 

Install Selenium
sh " docker run -d -p 4444:4444 selenium/standalone-chrome"
