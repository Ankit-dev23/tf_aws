output "ec2_instance_public_ip" {
  value       = aws_instance.web.ec2_instance_public_ip
  sensitive   = true
  description = "This is instance public IP"
  depends_on  = [aws_instance.web]
}
