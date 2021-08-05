locals {
  compartment_id = var.compartment_id == null ? var.tenancy_ocid : var.compartment_id
}

data "oci_objectstorage_namespace" "namespace" {
  compartment_id = local.compartment_id
}

data "oci_identity_compartment" "bucket_compartment" {
  id = local.compartment_id
}

resource "oci_identity_group" "bucket_access_group" {
  compartment_id = var.tenancy_ocid
  description    = "Group to grant access to the ${var.bucket_name} bucket."
  name           = "${var.bucket_name}-Bucket-Access"
}

resource "oci_identity_user" "s3fs_user" {
  compartment_id = var.tenancy_ocid
  description    = "Service Account for ${var.bucket_name} S3FS access"
  name           = "${var.bucket_name}-bucket-user"
}

resource "oci_identity_user_group_membership" "bucket_access_group_membership" {
  group_id = oci_identity_group.bucket_access_group.id
  user_id  = oci_identity_user.s3fs_user.id
}

resource "oci_identity_customer_secret_key" "s3fs_key" {
  display_name = "${var.bucket_name}-s3fs-access"
  user_id      = oci_identity_user.s3fs_user.id
}

resource "oci_objectstorage_bucket" "minecraft_bucket" {
  compartment_id = local.compartment_id
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.namespace.namespace
}

resource "oci_identity_policy" "minecraft_bucket_policy" {
  compartment_id = local.compartment_id
  description    = "Policy granting access to the ${var.bucket_name} bucket"
  name           = "${var.bucket_name}-Bucket-Policy"
  statements = [
    "Allow group id ${oci_identity_group.bucket_access_group.id} to manage objects in compartment id ${local.compartment_id} where target.bucket.name='${var.bucket_name}'",
    "Allow group id ${oci_identity_group.bucket_access_group.id} to read buckets in compartment id ${local.compartment_id} where target.bucket.name='${var.bucket_name}'",
  ]
}
