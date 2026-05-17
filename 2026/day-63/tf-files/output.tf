


output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "instance_id" {
  value = aws_instance.ec2.id
}
output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}
output "instance_public_dns" {
  value = aws_instance.ec2.public_dns
}
output "security_group_id" {
  value = aws_instance.ec2.vpc_security_group_ids
}
output "ami_id" {
  value = data.aws_ami.ami.id
}
output "all_availability_zones" {
  value = data.aws_availability_zones.available.names
}