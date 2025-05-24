output "instance_name" {
  description = "The name of the EC2 instance"
  value       = var.instance_name
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.instance1.public_ip
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.instance1.id
}
