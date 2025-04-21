# Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name       = "internet gateway"
    Managed_By = "terraform"
  }
}