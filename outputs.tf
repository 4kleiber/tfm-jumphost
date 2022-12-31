output "ec2_name" {
  value       = local.ec2_name
  description = "Name of the EC2 instance"
}

output "ec2_private_dns" {
    value = aws_instance.this.private_dns
    description = "EC2 instance private DNS"
}

output "ec2_private_ip" {
    value = aws_instance.this.private_ip
    description = "EC2 instance private IP"
}

output "ec2_public_dns" {
    value = aws_instance.this.public_dns
    description = "EC2 instance public DNS"
}

output "ec2_public_ip" {
    value = aws_instance.this.public_ip
    description = "EC2 instance public IP"
}
