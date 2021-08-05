output "nsg_id" {
  description = "The Network Security Group OCID."
  value       = oci_core_network_security_group.minecraft_network_security_group.id
}
