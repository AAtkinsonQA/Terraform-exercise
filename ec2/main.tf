resource "aws_key_pair" "demo_key" {
  key_name   = "demo-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC12njNX6gA/OXIEkUJE/vLVc7CEmR/AHDtYdD+losH2NDAlcTr+73A8MyF91a05er9034GhuyR6d/c5tMZdCvyCI0DbpTckaFKb4JHyiJAYK8B9GmGUwGdWcZKloDQiDatFKP8+h7HuvWsLiA66vUcpVvJapRqzAaFWZEwJVMvbVkbT1chsmnVnfn28vkmhEb+wMKpQPmpF0HPcZyr+DuC0GoA8fh4LTd6+JEENSzo3nrHdJxGH2BdoeAqZOUlZgHELSGgRUAOJzS+1jXKWh5NovXdSjFs/JGZyvunASATkHGlNEEum6TWL1gYkmj6tohmZTHjgVPBFzOCuSDb4ayx ubuntu@ip-172-31-39-227"
}

resource "aws_instance" "Instances" {
  for_each = var.ami-map
  ami      = each.value
  tags = {
    Name = each.key
  }
  instance_type          = var.instance-type
  key_name               = aws_key_pair.demo_key.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = var.associate_public_ip_address

}