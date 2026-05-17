
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true 
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-subnet"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-ig"
  })
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route  {
    cidr_block = var.cidr_all_ipv4
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-route-table"
  })
}

resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}


resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.vpc.id
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = var.cidr_all_ipv4
  from_port         = var.allowed_ports[2]
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[2]
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = var.cidr_all_ipv4
  from_port         = var.allowed_ports[0]
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[0]
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = var.cidr_all_ipv4
  from_port         = var.allowed_ports[1]
  ip_protocol       = "tcp"
  to_port           = var.allowed_ports[1]
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = var.cidr_all_ipv4
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ami.id             # "ami-09ed39e30153c3bf9"
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.sg.id ]
  subnet_id = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-server"
  })
}



resource "aws_s3_bucket" "s3" {
  bucket = "my-random-s3-bucket-uttkarsh-kesharwani"
  depends_on = [ aws_instance.ec2 ]
}
