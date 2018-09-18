resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.EC2.id}"
  allocation_id = "${aws_eip.EIP.id}"
}

/*resource "aws_key_pair" "auth" {
  key_name   = "Terraform_Key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

}*/

resource "aws_eip" "EIP" {
  vpc = true
}

output "ip" {
  value = "${aws_eip.EIP.public_ip}"
}

resource "aws_instance" "EC2" {
  ami = "ami-f90a4880"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  connection {
    user = "ubuntu"
    timeout = "1m"
  }

//  key_name = "Terraform_Key"
  key_name = "ua12"


  root_block_device {
    volume_type = "gp2"
    volume_size = 30
  }

  tags {
    Name = "Jenkins"
  }

/*  provisioner "remote-exec" {
    inline = [
      "wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -",
      "sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt-get update",
      "sudo apt-get install jenkins"
    ]
  }*/

  provisioner "local-exec" {
    command = "ansible-playbook -i ansible-jenkins/hosts ansible-jenkins/playbook.yml -e 'ansible_python_interpreter=/usr/bin/python3'"
  }
}