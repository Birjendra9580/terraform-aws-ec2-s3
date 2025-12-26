resource "aws_s3_bucket" "bucket" {
  bucket = "${var.s3_bucket_prefix}-${random_id.suffix.hex}"
  tags   = var.tags
}

resource "random_id" "suffix" {
  byte_length = 4
}
