resource "aws_s3_bucket" "this" {
  bucket = var.bucket
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "this" {
  bucket = aws_s3_bucket.this.id
}