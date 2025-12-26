data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"]

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }

  vpc_id = data.aws_vpc.selected.id
}

data "aws_key_pair" "existing" {
  key_name = var.key_pair_name
}
