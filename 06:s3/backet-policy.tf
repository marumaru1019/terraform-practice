resource "aws_s3_bucket_policy" "alb_log" {
  bucket = aws_s3_bucket.alb_log.id
  policy = data.aws_iam_policy_document.alb_log.json
}

data "aws_iam_policy_document" "alb_log" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.alb_log.id}/*"]

    # アクセスを許可するリージョンのIDを選択: https://docs.aws.amazon.com/ja_jp/elasticloadbalancing/latest/classic/enable-access-logs.html
    principals {
      type        = "AWS"
      identifiers = ["582318560864"]
    }
  }
}
