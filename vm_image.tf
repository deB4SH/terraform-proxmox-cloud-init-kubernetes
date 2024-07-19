#image from here: https://cloud.debian.org/images/cloud/bookworm/daily/20240412-1715/
resource "proxmox_virtual_environment_download_file" "image" {
  for_each = { for each in var.vm_images : each.name => each}

  node_name    = var.node_name
  content_type = "iso"
  datastore_id = each.value.datastore_id
  file_name          = each.value.filename
  url                = each.value.url
  checksum           = each.value.checksum
  checksum_algorithm = each.value.checksum_algorithm
}