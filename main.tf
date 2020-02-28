
resource "aws_ebs_volume" "pscloud-ebs-volumes" {
  count                     = length(var.pscloud_ebs_volumes)

  availability_zone         = var.pscloud_subnet_id
  type                      = var.pscloud_ebs_volumes[count.index].type
  size                      = var.pscloud_ebs_volumes[count.index].size
  encrypted                 = var.pscloud_ebs_volumes[count.index].encrypted
  kms_key_id                = var.pscloud_kms_key_id

  tags = {
    Name    = "${var.pscloud_company}_ebs_${var.pscloud_env}_${var.pscloud_project}"
    Project = var.pscloud_project
  }
}

resource "aws_volume_attachment" "pscloud-ebs-volumes-attachment" {
  count                     = length(var.pscloud_ebs_volumes)

  device_name               = var.pscloud_ebs_volumes[count.index].device_name
  volume_id                 = aws_ebs_volume.pscloud-ebs-volumes[count.index].id
  instance_id               = var.pscloud_ec2_instance_id

  depends_on = [ aws_ebs_volume.pscloud-ebs-volumes ]
}