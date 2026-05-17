variable "region" {
  type = string
  default = "ap-south-1"
  description = "provide the region where to launch the resource on"
}

variable "cidr_all_ipv4" {
  type = string
  default = "0.0.0.0/0"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "project_name" {
  type = string
  # If no default value is given then terraform will force to ask the value to provide it
}

variable "environment" {
  type =  string
  default = "dev"
}

variable "allowed_ports" {
  type = list(number)
  default = [22,80,443]
}

variable "extra_tags" {
  type = map(string)
  default = {
    
  }
}

