# local変数は引数で書き換えることができない
locals {
    ami = "ami-0c3fd0f5d33134a76"
    instance_type = "t2.micro"
}

# local.変数という形で取得
resource "aws_instance" "example" {
    ami = local.ami
    instance_type = local.instance_type
}