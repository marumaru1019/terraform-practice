
module "describe_regions_for_ec2" {
  # module内のtfを使用
  source     = "./module"
  name       = "describe-regions-for-ec2"
  # ec2のみにアクセス権限を付与
  identifier = "ec2.amazonaws.com"
  # どのポリシーを使うか選択
  policy     = data.aws_iam_policy_document.allow_describe_regions.json
}