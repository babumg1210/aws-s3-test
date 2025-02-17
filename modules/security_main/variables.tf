variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
}

variable "ingress_from_port" {
  description = "The starting port for ingress rules"
  type        = number
}

variable "ingress_to_port" {
  description = "The ending port for ingress rules"
  type        = number
}

variable "ingress_protocol" {
  description = "The protocol for ingress rules"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "The CIDR blocks for ingress rules"
  type        = list(string)
}

variable "egress_from_port" {
  description = "The starting port for egress rules"
  type        = number
}

variable "egress_to_port" {
  description = "The ending port for egress rules"
  type        = number
}

variable "egress_protocol" {
  description = "The protocol for egress rules"
  type        = string
}

variable "egress_cidr_blocks" {
  description = "The CIDR blocks for egress rules"
  type        = list(string)
}
