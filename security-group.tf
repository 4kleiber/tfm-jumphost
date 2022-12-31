resource "aws_security_group" "this" {
  name        = local.ec2_name
  description = "Allow Access to ${local.ec2_name}"
  vpc_id      = var.vpc_id

  tags = merge({
    Name = local.ec2_name
  }, var.tags)
}

resource "aws_security_group_rule" "allow_ssh" {
  description       = "Allow SSH Access to jumphost"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "allow_egress_traffic" {
  description       = "Allow Egress-Access"
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.this.id
}