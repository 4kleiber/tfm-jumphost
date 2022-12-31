resource "random_id" "id" {
  byte_length = 4
}

locals {
  name_postfix = random_id.id.hex
  ec2_name     = "${var.owner}-jumphost-${local.name_postfix}"
}