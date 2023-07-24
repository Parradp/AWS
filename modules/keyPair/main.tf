locals {
  env = lower(var.environment)
}

resource "tls_private_key" "this" {
  algorithm = var.algorithm
}

resource "aws_key_pair" "this" {
  key_name   = "Key${var.project_name}"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_secretsmanager_secret" "secret_name" {
  name = "Key${var.project_name}.pem"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "secret_value" {
  secret_id     = aws_secretsmanager_secret.secret_name.id
  secret_string = tls_private_key.this.private_key_openssh
}