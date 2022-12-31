variable "additional_security_group_ids" {
  type        = list(string)
  default     = []
  description = "List of additional security group ids to attach to the ec2 instace"
  nullable    = false
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
  nullable    = false
}

variable "enable_ssh" {
  type        = bool
  default     = true
  description = "Whether to enable SSH access"
  nullable    = false
}

variable "owner" {
  type        = string
  description = "Owner of jumphost"
  nullable    = false
}

variable "ssh_key" {
    type = string
    description = "SSH Key which can access the EC2 instance"
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "Subnet to launch ec2 instance into"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional Tags"
}

variable "vpc_id" {
  type        = string
  description = "VPC-ID to create the security group into"
  nullable    = false
}