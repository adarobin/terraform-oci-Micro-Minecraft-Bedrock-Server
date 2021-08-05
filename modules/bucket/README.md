# Minecraft Bedrock Backup Bucket

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
| [oci_identity_customer_secret_key.s3fs_key](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_customer_secret_key) | resource |
| [oci_identity_group.bucket_access_group](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_group) | resource |
| [oci_identity_policy.minecraft_bucket_policy](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_user.s3fs_user](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_user) | resource |
| [oci_identity_user_group_membership.bucket_access_group_membership](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_user_group_membership) | resource |
| [oci_objectstorage_bucket.minecraft_bucket](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [oci_identity_compartment.bucket_compartment](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartment) | data source |
| [oci_objectstorage_namespace.namespace](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The compartment to create the bucket in. This must be the compartment that has the Amazon S3 Compatibility API enabled. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the bucket used to store backups. | `string` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | The OCID of the tenancy the bucket is being deployed in. This is needed to configure a service account and policy for access to the bucket. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | The access key used to mount the Minecraft backup bucket with S3FS |
| <a name="output_name"></a> [name](#output\_name) | The name of the bucket for Minecraft backups |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace where the bucket with Minecraft backups resides. |
| <a name="output_secret_key"></a> [secret\_key](#output\_secret\_key) | The secret key used to mount the Minecraft backup bucket with S3FS |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
