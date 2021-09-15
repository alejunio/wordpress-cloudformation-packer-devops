packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


source "amazon-ebs" "ubuntu-bionic" {
  ami_name      = "${var.aws_ami}"
  instance_type = "t2.micro"
  region        = "${var.aws_region}"
  access_key    = "${var.aws_access_key}"
  secret_key    = "${var.aws_secret_key}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}


build {
  sources = [
    "source.amazon-ebs.ubuntu-bionic"
  ]

  provisioner "file" {
    source      = "init.sh"
    destination = "/home/ubuntu/init.sh"
  }
 
  provisioner "file" {
    source      = "../ansible.zip"
    destination = "/home/ubuntu/ansible.zip"
  }

  provisioner "shell" {
    inline = [
      "sudo mkdir -p /home/projeto/",
      "cd /home/ubuntu/ && sudo mv ansible.zip /home/projeto/",
      "sudo apt update && sudo apt install unzip -y",
      "cd /home/projeto/ && sudo unzip ansible.zip && sudo rm -rf ansible.zip",
      "sudo chmod +x /home/ubuntu/init.sh",
      "sudo bash /home/ubuntu/init.sh",
      "sudo mkdir -p /home/wordpress/public_html/",
      "sudo ansible-playbook /home/projeto/ansible/init.yml",
      "sudo ansible-playbook /home/projeto/ansible/playbook.yml",  
    ]
  }
}
