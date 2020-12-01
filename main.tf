
resource "aws_ebs_volume" "pscloud-ebs-volumes" {
  for_each                  = var.pscloud_ebs_volumes

  availability_zone         = var.pscloud_subnet_id
  type                      = each.value.type
  size                      = each.value.size
  encrypted                 = each.value.encrypted
  kms_key_id                = var.pscloud_kms_key_id
  multi_attach_enabled      = each.value.multi_attach_enabled
  iops                      = each.value.iops

  tags = {
    Name    = "${var.pscloud_company}_ebs_${var.pscloud_env}_${var.pscloud_project}"
    Project = var.pscloud_project
  }
}

resource "aws_volume_attachment" "pscloud-ebs-volumes-attachment" {
  for_each                  = var.pscloud_ebs_volumes_attachments

  device_name               = each.value.device_name
  volume_id                 = each.value.volume_id
  instance_id               = each.value.instance_id

  depends_on = [ aws_ebs_volume.pscloud-ebs-volumes ]
}