provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0ad21ae1d0696ad58"  # Amazon Linux 2 AMI ID for ap-south-1
  instance_type = "t2.medium"
  vpc_security_group_ids = ["sg-06a38297c80c90f8c"]  # Correct key for specifying security group

  user_data = <<-EOF
              #!/bin/bash
              # Update and install necessary packages
              apt-get update -y
              apt-get install -y git docker.io awscli unzip

              # Start Docker service
              systemctl start docker
              usermod -aG docker jenkins

              # Install Jenkins
              apt-get install -y openjdk-11-jdk
              wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
              sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              apt-get update -y
              apt-get install -y jenkins
              systemctl start jenkins
              systemctl enable jenkins

              # Install kubectl
              curl -LO "https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl"
              chmod +x ./kubectl
              mv ./kubectl /usr/local/bin/kubectl

              # Install Terraform
              curl -LO "https://releases.hashicorp.com/terraform/1.4.0/terraform_1.4.0_linux_amd64.zip"
              unzip terraform_1.4.0_linux_amd64.zip
              mv terraform /usr/local/bin/

              # Clean up
              apt-get clean

              # Output Jenkins initial admin password
              echo "Jenkins initial admin password:"
              cat /var/lib/jenkins/secrets/initialAdminPassword
              EOF

  key_name = "homekey"  # Replace with your key pair name

  tags = {
    Name = "jenkins-server"
  }
}
       
