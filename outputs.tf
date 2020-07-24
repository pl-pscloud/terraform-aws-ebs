output "pscloud_ebs_arns" {
  value = aws_ebs_volume.pscloud-ebs-volumes.*.arn
}