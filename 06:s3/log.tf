

resource "aws_s3_bucket" "alb_log" {
  bucket = "alb-log-pragmatic-terraform-chan"

  # 一定期間でファイルが削除されるように設定
  lifecycle_rule {
    enabled = true

    # 230日後に自動削除
    expiration {
      days = "230"
    }
  }
}
