resource "aws_instance" "ec2" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  subnet_id            = data.aws_subnet.selected.id
  key_name             = data.aws_key_pair.existing.key_name
  iam_instance_profile = aws_iam_instance_profile.profile.name

  tags = merge(
    var.tags,
    { Name = "terraform-ec2-s3" }
  )
}
