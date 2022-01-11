resource "aws_ebs_volume" "elhadji-ebs" {
  availability_zone = "us-east-1a"
  size = "${var.ebs-size}"
  tags = {
    Name = "${var.admin}-ebs-terraform"
    formateur = "${var.formateur}"
  }
}

output "ebs-id" {
    value = aws_ebs_volume.elhadji-ebs.id
}