data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      # ec2のみに関連付ける
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}