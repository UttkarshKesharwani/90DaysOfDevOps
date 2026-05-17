
data "aws_ami" "ami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
     name = "root-device-type"
     values = [ "ebs" ]
  }
  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }

}   

data "aws_availability_zones" "available" {
  state = "available"
}

