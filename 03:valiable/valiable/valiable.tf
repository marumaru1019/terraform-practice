# valiable 変数 {}で変数を定義
variable "example_instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0c3fd0f5d33134a76"
    # var.変数名で変数を使うことができる
  instance_type = var.example_instance_type
}