output "ec2_instance_public_ip" {
  value       = aws_instance.web.public_ip
  sensitive   = false
  description = "This is instance public IP"
  depends_on  = [aws_instance.web]
}
