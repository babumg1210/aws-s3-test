variable "instance_count" {
  description = "The number of instances to create"
  type        = number
}

variable "ami_id" {
  description = "The AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instances in"
  type        = string
}

variable "security_groups" {
  description = "The security groups to attach to the instances"
  type        = list(string)
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "country" {
  description = "The country tag for the instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the root volume"
  type        = number
}

variable "volume_type" {
  description = "The type of the root volume"
  type        = string
}
