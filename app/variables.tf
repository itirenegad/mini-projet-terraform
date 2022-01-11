variable "instance_type" {
  default = "t2.micro"
}

variable "ami_name" {
  default = "ami-04505e74c0741db8d"
}

variable "admin" {
  default = "elhadji"
}

variable "key_name" {
  default = "elhadji-kp-ajc"
}

variable "sg_name" {
  default = "elhadi-sg-terraform"
  type    = string
}

variable "formateur" {
  default = "Frazer"
  type    = string
}

variable "ec2-id" {
  default = ""
}