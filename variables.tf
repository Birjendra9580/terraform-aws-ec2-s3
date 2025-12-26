variable "aws_region" {
    description = "resion for resources"
    type        = string
}

variable "vpc_name" {
    description = "vpc_id"
    type        = string
}

variable "subnet_name" {
    description = "subnet id for resources"
    type        = string
}

variable "key_pair_name" {
    description = "key pair for ec2"
    type        = string
}

variable "instance_type" {
    description = "ec2 instance type"
    type        = string
    default     = "t3.micro"
}

variable "s3_bucket_prefix" {
    description = "prefix of s3 bucket"
    type        = string
}

variable "tags" {
    description = "tags for resources"
    type = map(string)
}

