resource "aws_instance" "example" {
    # 起動するマシンのタイプ
  ami           = "ami-0c3fd0f5d33134a76"
  instance_type = "t2.micro"

    # タグをつける
  tags = {
    Name = "tagchan"
  }

}