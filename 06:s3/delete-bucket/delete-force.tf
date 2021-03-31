resource "aws_s3_bucket" "force_destroy" {
  # 削除するバケットの名前
  bucket        = "force-destroy-pragmatic-terraform-chan"
  force_destroy = true
}