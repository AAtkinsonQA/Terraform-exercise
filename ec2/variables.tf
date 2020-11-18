variable "ami-map" {
  type = map
  default = {
    "ubuntu" = "ami-0dc8d444ee2a42d8a"
    "CentOS" = "ami-0b850cf02cc00fdc8"
  }
}
variable "instance-type" {
  default = "t2.micro"
}
variable "subnet_id" {
}
variable "tags" {
  default = "main"
}
variable "associate_public_ip_address" {
  default = "true"
}
variable "vpc_security_group_ids" {
}