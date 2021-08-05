# Minecraft Bedrock Network Security Group

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >=4.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >=4.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_network_security_group.minecraft_network_security_group](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group) | resource |
| [oci_core_network_security_group_security_rule.minecraft_ipv4_rule](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.minecraft_ipv6_rule](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.minecraft_ping6_rule](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |
| [oci_core_network_security_group_security_rule.minecraft_ping_rule](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_network_security_group_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The compartment to create the Network Security Group in. | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the network security group. Defaults to "Minecraft Network Security Group". | `string` | `"Minecraft Network Security Group"` | no |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | The OCID of the VCN that the Network Security Group should be created on. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | The Network Security Group OCID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
