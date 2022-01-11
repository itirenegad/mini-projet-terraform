resource "aws_eip" "elhadji-eip" {
  vpc = true
  tags = {
    Name = "${var.eip_name}"
    formateur = "${var.formateur}"

  }
}

output "link_epi" {
    value = aws_eip.elhadji-eip.allocation_id
}

output "publicip" {
    value = aws_eip.elhadji-eip.public_ip
}