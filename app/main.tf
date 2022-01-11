module "my-ec2-module" {
  source        = "../modules/ec2"
  key_name      = "elhadji-kp-ajc"
  instance_type = "t2.small"
}

module "my-sg-module" {
  source  = "../modules/sg"
  sg_name = "${var.admin}-mp-tf"
}

module "my-eip-module" {
  source   = "../modules/eip"
  eip_name = "${var.admin}-elastic-ip"

}

module "my-ebs-module" {
  source   = "../modules/ebs"
  ebs-size = 10
  ebs_name = "terraform-deploy-nginx"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = module.my-ebs-module.ebs-id
  instance_id = module.my-ec2-module.ec2-id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.my-ec2-module.ec2-id
  allocation_id = module.my-eip-module.link_epi
}

resource "local_file" "datafile" {
  filename = "../ip_ec2.txt"
  content  = "L'ip de votre déploiement est ${module.my-eip-module.publicip}"
}
