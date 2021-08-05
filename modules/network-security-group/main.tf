resource "oci_core_network_security_group" "minecraft_network_security_group" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = "Minecraft Network Security Group"
}

resource "oci_core_network_security_group_security_rule" "minecraft_ipv4_rule" {
  network_security_group_id = oci_core_network_security_group.minecraft_network_security_group.id
  direction                 = "INGRESS"
  protocol                  = 17 #UDP
  description               = "Allow Minecraft Bedrock over IPv4"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  stateless                 = false
  udp_options {
    destination_port_range {
      max = 19132
      min = 19132
    }
  }
}

resource "oci_core_network_security_group_security_rule" "minecraft_ipv6_rule" {
  network_security_group_id = oci_core_network_security_group.minecraft_network_security_group.id
  direction                 = "INGRESS"
  protocol                  = 17 #UDP
  description               = "Allow Minecraft Bedrock over IPv6"
  source                    = "::/0"
  source_type               = "CIDR_BLOCK"
  stateless                 = false
  udp_options {
    destination_port_range {
      max = 19133
      min = 19133
    }
  }
}

resource "oci_core_network_security_group_security_rule" "minecraft_ping_rule" {
  network_security_group_id = oci_core_network_security_group.minecraft_network_security_group.id
  direction                 = "INGRESS"
  protocol                  = 1 #ICMP
  description               = "Allow ping over IPv4"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  stateless                 = false
  icmp_options {
    type = 8
    code = 0
  }
}

resource "oci_core_network_security_group_security_rule" "minecraft_ping6_rule" {
  network_security_group_id = oci_core_network_security_group.minecraft_network_security_group.id
  direction                 = "INGRESS"
  protocol                  = 58 #ICMPv6
  description               = "Allow ping over IPv6"
  source                    = "::/0"
  source_type               = "CIDR_BLOCK"
  stateless                 = false
  icmp_options {
    type = 128
    code = 0
  }
}
