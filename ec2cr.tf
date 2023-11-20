resource "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_subnet" "default" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "172.31.0.0/16"
  map_public_ip_on_launch = true
}


resource "aws_instance" "tf-server" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-09490149fdf4c4143"
  associate_public_ip_address = true
  tags = {
    Name = "tf-server"
  }
}