resource "aws_instance" "elhadji-ec2" {
  ami = "${var.ami_name}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  security_groups = ["elhadji-sg-terraform"]
  tags = {
    Name = "${var.admin}-ec2"
    formateur = "${var.formateur}"
    iac  = "terraform"
  }
  user_data = <<-EOF
            #!/bin/bash
            sudo apt-get update -y
            sudo apt-get install -y nginx
            sudo systemctl enable nginx
            sudo systemctl start nginx
            EOF
}

output "ec2-id" {
    value = aws_instance.elhadji-ec2.id
}