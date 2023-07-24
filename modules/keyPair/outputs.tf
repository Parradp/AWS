output "key_pair" {
  description = "Key name in AWS/EC2/KeyPair"
  value = aws_key_pair.this.key_name
} 