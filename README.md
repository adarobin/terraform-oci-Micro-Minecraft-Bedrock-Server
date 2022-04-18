# Minecraft Bedrock on OCI

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >=4.37.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_minecraft_bucket"></a> [minecraft\_bucket](#module\_minecraft\_bucket) | ./modules/bucket | n/a |
| <a name="module_minecraft_instance"></a> [minecraft\_instance](#module\_minecraft\_instance) | adarobin/E2-Micro-Always-Free-Instance/oci | >= 0.3.0 |
| <a name="module_minecraft_network_security_group"></a> [minecraft\_network\_security\_group](#module\_minecraft\_network\_security\_group) | ./modules/network-security-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_ipv6_address"></a> [assign\_ipv6\_address](#input\_assign\_ipv6\_address) | Whether or not an IPv6 address should be assigned to the instance. Requires a subnet with IPv6 enabled. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Whether or not a public IP should be assigned to the instance.  Defaults to `null` which assigns a public IP based on whether the subnet is public or private. The Free Tier only includes 2 public IP addresses so you may need to set this to `false`. | `bool` | `null` | no |
| <a name="input_availability_domain"></a> [availability\_domain](#input\_availability\_domain) | The availability domain of the instance. | `string` | n/a | yes |
| <a name="input_bucket_compartment_id"></a> [bucket\_compartment\_id](#input\_bucket\_compartment\_id) | The compartment to create the bucket in. This must be the compartment that has the Amazon S3 Compatibility API enabled. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`. | `string` | `null` | no |
| <a name="input_instance_compartment_id"></a> [instance\_compartment\_id](#input\_instance\_compartment\_id) | The compartment to create the instance in. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The hostname of the instance. Also used to generate names for the bucket and network security group. | `string` | `"minecraft"` | no |
| <a name="input_nsg_compartment_id"></a> [nsg\_compartment\_id](#input\_nsg\_compartment\_id) | The compartment to create the network security group in. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`. | `string` | `null` | no |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | The public SSH key(s) that should be authorized for the default user. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The OCID of the subnet to create the VNIC in. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | The OCID of the tenancy the bucket is being deployed in. This is needed to configure a service account and policy for access to the bucket. | `string` | n/a | yes |
| <a name="input_vcn_id"></a> [vcn\_id](#input\_vcn\_id) | The OCID of the VCN that the Network Security Group should be created on. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | The IPv6 address assigned to the instance. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The private IP address assigned to the instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address assigned to the instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
