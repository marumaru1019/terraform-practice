# プライベートバケット

resource "aws_s3_bucket" "private" {

  # バケット名 (世界の誰ともかぶっちゃだめ)
  bucket = "private-bucket-manman"

  # enabled true にしておくと以前のバージョンにいつでも戻せるようになる
  versioning {
    enabled = true
  }

  # 暗号化の設定
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}