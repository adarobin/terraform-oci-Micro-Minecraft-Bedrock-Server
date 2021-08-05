output "access_key" {
  description = "The access key used to mount the Minecraft backup bucket with S3FS"
  value       = oci_identity_customer_secret_key.s3fs_key.id
}

output "secret_key" {
  description = "The secret key used to mount the Minecraft backup bucket with S3FS"
  value       = oci_identity_customer_secret_key.s3fs_key.key
  sensitive   = true
}

output "name" {
  description = "The name of the bucket for Minecraft backups"
  value       = oci_objectstorage_bucket.minecraft_bucket.name
}

output "namespace" {
  description = "The namespace where the bucket with Minecraft backups resides."
  value       = oci_objectstorage_bucket.minecraft_bucket.namespace
}
