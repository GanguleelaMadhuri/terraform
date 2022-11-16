resource "aws_s3_bucket" "leela" {
  bucket = "my-leela-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
