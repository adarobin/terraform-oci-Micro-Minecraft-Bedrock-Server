locals {
  instance_compartment_id = var.instance_compartment_id == null ? var.tenancy_ocid : var.instance_compartment_id
  bucket_compartment_id   = var.bucket_compartment_id == null ? var.tenancy_ocid : var.bucket_compartment_id
  nsg_compartment_id      = var.nsg_compartment_id == null ? var.tenancy_ocid : var.nsg_compartment_id
}

module "minecraft_instance" {
  source  = "adarobin/E2-Micro-Always-Free-Instance/oci"
  version = ">= 0.3.0"

  compartment_id      = local.instance_compartment_id
  availability_domain = var.availability_domain

  hostname                 = var.name
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "20.04"
  boot_volume_size_in_gbs  = 50

  assign_ipv6_address = var.assign_ipv6_address
  assign_public_ip    = var.assign_public_ip
  nsg_ids             = [module.minecraft_network_security_group.nsg_id]
  subnet_id           = var.subnet_id

  ssh_authorized_keys = var.ssh_authorized_keys
  user_data = base64encode(templatefile("${path.module}/minecraft-be.sh", {
    bucket_access_key = module.minecraft_bucket.access_key
    bucket_secret_key = module.minecraft_bucket.secret_key
    bucket_name       = module.minecraft_bucket.name
    bucket_namespace  = module.minecraft_bucket.namespace
  }))

  depends_on = [
    module.minecraft_bucket,
    module.minecraft_network_security_group,
  ]
}

module "minecraft_bucket" {
  source         = "./modules/bucket"
  tenancy_ocid   = var.tenancy_ocid
  compartment_id = local.bucket_compartment_id
  name           = var.name
}

module "minecraft_network_security_group" {
  source         = "./modules/network-security-group"
  compartment_id = local.nsg_compartment_id
  vcn_id         = var.vcn_id
  display_name   = "${var.name} Network Security Group"
}
