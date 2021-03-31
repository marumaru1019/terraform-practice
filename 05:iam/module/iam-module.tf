variable "name" {}
variable "policy" {}
variable "identifier" {}

/*

iamロール   : ユーザーやグループにサービスの操作権限を付与するもの
iamポリシー : awsのサービスに他のサービスへのアクセス権を付与できる

*/

# ~~~~~~~~~~~~~~~~~~ iam ロールの定義 ~~~~~~~~~~~~~~~~~~
resource "aws_iam_role" "default" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# ~~~~~~~~~~~~~~~~~~ 信頼ポリシーの定義 ~~~~~~~~~~~~~~~~~~

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [var.identifier]
    }
  }
}

# ~~~~~~~~~~~~~~~~~~ iam ポリシーの定義 ~~~~~~~~~~~~~~~~~~

resource "aws_iam_policy" "default" {
  name   = var.name
  policy = var.policy
}

# ~~~~~~~~~~~~~~~~ iamロールにiamポリシーをアタッチ ~~~~~~~~~~~~~

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

# ~~~~~~~~~~~~~~~ iamロールの出力 ~~~~~~~~~~~~~~~~~~

output "iam_role_arn" {
  value = aws_iam_role.default.arn
}

output "iam_role_name" {
  value = aws_iam_role.default.name
}