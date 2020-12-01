variable "pscloud_env" {}
variable "pscloud_company" {}
variable "pscloud_project" {}
variable "pscloud_subnet_id" {}
variable "pscloud_kms_key_id" { default = ""}

variable "pscloud_ebs_volumes" {
  type = map(object({
    type                  = string
    size                  = number
    encrypted             = bool
    device_name           = string
    multi_attach_enabled  = bool
    iops                  = number
  }))

  default = {
  }
}

variable "pscloud_ebs_volumes_attachments" {
  type = map(object({
    instance_id           = string
    volume_id             = string
    device_name           = string
  }))

  default = {
  }
}


