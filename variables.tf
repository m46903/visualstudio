variable "aws_region" {
  description = "Region for the VPC"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "10.10.1.0/24"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-0323c3dd2da7fb37d"

}

variable "indexer" {
  default = "i3.4xlarge"
}

variable "search_head" {
  default = "m4.4xlarge"
}

variable "cluster_master" {
  default = "m4.large"
}
