resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.dev-vpc.id
  count             = length(var.private_subnet)
  cidr_block        = var.private_subnet[count.index]
  availability_zone = var.ap-southeast-1-azs[count.index]
  tags = {
    Name : "${var.env_prefix}-private-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.dev-vpc.id // Correct
  count                   = length(var.public_subnet)
  cidr_block              = var.public_subnet[count.index]
  availability_zone       = var.ap-southeast-1-azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name : "${var.env_prefix}-public-subnet-${count.index + 1}"
  }
}