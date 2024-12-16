output "aws_instances" {
  value = [for instances in aws_instance.ec2_instances : instances.public_ip]
}
