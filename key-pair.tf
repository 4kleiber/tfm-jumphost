resource "aws_key_pair" "this" {
  key_name   = local.ec2_name
  public_key = var.ssh_key
}