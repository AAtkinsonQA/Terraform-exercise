variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80, 443]
}
variable "open-internet" {
  default = ["0.0.0.0/0"]
}
variable "vpc_id" {
}