output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = module.minecraft_instance.private_ip
}

output "public_ip" {
  description = "The public IP address assigned to the instance."
  value       = module.minecraft_instance.public_ip
}

output "ipv6_address" {
  description = "The IPv6 address assigned to the instance."
  value       = module.minecraft_instance.ipv6_address
}
