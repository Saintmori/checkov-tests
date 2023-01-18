resource "aws_instance" "web_instance" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  tags = {
    Name        = "second"
    env = "dev"
    team = "infra"
  }
}