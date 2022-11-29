resource "aws_instance" "DEV" {
  ami           = "ami-062f8fed5598d67c3"
  instance_type = "t2.micro"

  tags = {
    Name = "DEV"
  }
}
