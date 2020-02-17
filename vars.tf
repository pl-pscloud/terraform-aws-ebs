variable "pscloud_env" {}
variable "pscloud_company" {}
variable "pscloud_key_name" {}
variable "pscloud_project" {}
variable "pscloud_subnet_id" {}
variable "pscloud_kms_key_id" { default = ""}
variable "pscloud_ec2_instance_id" {}

variable "pscloud_ebs_volumes" {
  type = list(object({
    type          = string
    size          = number
    encrypted     = bool
    device_name   = string
  }))
  default = []
}


