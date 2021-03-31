resource "aws_instance" "example" {
  ami                    = "ami-0c3fd0f5d33134a76"
  instance_type          = "t2.micro"

  # security.tfで作成したセキュリティグループと紐付け
  vpc_security_group_ids = [aws_security_group.example_ec2.id]

  # apacheのインストール
  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
EOF
}

# dns(domain name system) : ドメイン名の確認 ここにアクセスしてステータスを確かめる
output "example_public_dns" {
  value = aws_instance.example.public_dns
}

# curl {aws_instance.example.public_dns} でhtmlが帰ってくれば成功