resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = var.security_groups
  tags = {
    Name = var.instance_name
    Country = var.country
  }
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
}
