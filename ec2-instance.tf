data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_instance_type
  key_name = aws_key_pair.this.id
subnet_id = var.subnet_id
  vpc_security_group_ids = concat([aws_security_group.this.id], var.additional_security_group_ids)

  tags = merge({
    Name          = local.ec2_name
    JumpHostOwner = var.owner
  }, var.tags)
}
