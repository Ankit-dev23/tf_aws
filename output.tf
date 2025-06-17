# output "ec2_instance_public_ip" {
#   value       = aws_instance.web.public_ip
#   sensitive   = false
#   description = "This is instance public IP"
#   depends_on  = [aws_instance.web]
# }

# output "s3_bucket_name_or_id" {
#   value       = aws_s3_bucket.ankit_bucket.bucket
#   sensitive   = false
#   description = "This is instance public IP"
#   depends_on  = [aws_s3_bucket.ankit_bucket]
# }
