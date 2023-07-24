variable "environment" {}
variable "project_name" {}
variable "algorithm" {
  type    = string
  default = "RSA"

 validation {
    condition     = contains(["ED25519", "RSA"], var.algorithm)
    error_message = "Algorithm value must be ED25519 or RSA"
  }
}