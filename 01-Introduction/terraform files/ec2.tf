#resource block
resource "aws_instance" "ubuntu" {
  ami = data.aws_ami-083654bd07b5da81d
  instance_type = var.my_instance_type
  user_data = file("${path.module}/ansible-install-ubuntu.sh")
  key_name = var.my_key

  tags = {
    "Name" = "Ansible-Ubuntu"
  }
}

resource "aws_instance" "rhel" {
  ami = data.aws_ami-0b0af3577fe5e3532
  instance_type = var.my_instance_type
  user_data = file("${path.module}/ansible-install-rhel.sh")
  key_name = var.my_key

  tags = {
    "Name" = "Ansible-rhel8"
  }
}

resource "aws_instance" "ubuntu-hosts" {
  ami = data.aws_ami-083654bd07b5da81d
  instance_type = var.my_instance_type
  user_data = file("${path.module}/create_ansible_user.sh")
  key_name = var.my_key
  count = 3
  tags = {
    "Name" = "My-Ubuntu-${count.index}"
    "Type" = "My-Ubuntu-${count.index}"
  }
}

resource "aws_instance" "rhel-hosts" {
  ami = data.aws_ami-0b0af3577fe5e3532
  instance_type = var.my_instance_type
  user_data = file("${path.module}/create_ansible_user.sh")
  key_name = var.my_key
  count = 5
  tags = {
    "Name" = "My-rhel-${count.index}"
  }
}
