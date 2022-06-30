resource "aws_vpc" "main" {
  cidr_block = "13.0.0.0/16"

  tags = {
      Name = "WorkloadClusterVPC"
  }
}

resource "aws_subnet" "public" {
 vpc_id = aws_vpc.main.id
 cidr_block = "13.0.0.0/24"
 availability_zone = "us-east-1a"
 map_public_ip_on_launch = true

 tags = {
     Name = "WC Public Subnet"
 } 
}

resource "aws_subnet" "private" {
 vpc_id = aws_vpc.main.id
 cidr_block = "13.0.1.0/24"
 availability_zone = "us-east-1b"
 map_public_ip_on_launch = true
 tags = {
     Name = "WC Private Subnet"
 }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "WCRT1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "WCRT1"
  }
}

resource "aws_route_table_association" "PubSub" {
  route_table_id = aws_route_table.WCRT1.id
  subnet_id = aws_subnet.public.id
}
resource "aws_route_table_association" "PrivSub" {
  route_table_id = aws_route_table.WCRT1.id
  subnet_id = aws_subnet.private.id
}

# resource "aws_route" "igw" {
#     route_table_id = aws_route_table.MCRT1.id
#     destination_cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
# }