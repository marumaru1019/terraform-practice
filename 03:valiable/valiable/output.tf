# local変数は引数で書き換えることができない
locals {
    ami = "ami-0c3fd0f5d33134a76"
    instance_type = "t2.micro"
}


resource "aws_instance" "example" {
  ami           = local.ami
  instance_type = local.instance_type
}

# " terraform apply " をする際に作成されたインスタンスのidを確認することができる
output "example_instance_id" {
  value = aws_instance.example.id
}

/*
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

example_instance_id = インスタンスのidとなればok
*/