resource "aws_s3_bucket" "ankit_bucket" {
  bucket = "ankit-bucket-nrzb1234"
}

# resource "aws_s3_object" "Upload_my_file" {
#   bucket = aws_s3_bucket.ankit_bucket.bucket
#   source = "./S3_data/ankit.txt"
#   key    = "myfile.txt"
# }

