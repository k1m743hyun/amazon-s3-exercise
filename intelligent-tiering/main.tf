module "s3" {
  source = "./modules/s3"

  bucket = var.s3_bucket
}