resource "aws_s3_bucket" "this" {
  bucket = var.bucket

  force_destroy = true
}

#resource "aws_s3_bucket_intelligent_tiering_configuration" "this" {
#  bucket = aws_s3_bucket.this.id
#  name = var.bucket

#  tiering {
#    access_tier = "ARCHIVE_ACCESS"
#    days        = 90
#  }

  #tiering {
  #  access_tier = "DEEP_ARCHIVE_ACCESS"
  #  days        = 180
  #}
#}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = var.bucket
    status = "Enabled"
    transition {
      storage_class = "INTELLIGENT_TIERING"
    }
  }
}