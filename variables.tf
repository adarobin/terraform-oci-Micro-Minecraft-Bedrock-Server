variable "availability_domain" {
  description = "The availability domain of the instance."
  type        = string
}

variable "assign_ipv6_address" {
  description = "Whether or not an IPv6 address should be assigned to the instance. Requires a subnet with IPv6 enabled. Defaults to `false`."
  type        = bool
  default     = false
}

variable "assign_public_ip" {
  description = "Whether or not a public IP should be assigned to the instance.  Defaults to `null` which assigns a public IP based on whether the subnet is public or private. The Free Tier only includes 2 public IP addresses so you may need to set this to `false`."
  type        = bool
  default     = null
}

variable "bucket_compartment_id" {
  description = "The compartment to create the bucket in. This must be the compartment that has the Amazon S3 Compatibility API enabled. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`."
  type        = string
  default     = null
}

variable "instance_compartment_id" {
  description = "The compartment to create the instance in. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`."
  type        = string
  default     = null
}

variable "name" {
  description = "The hostname of the instance. Also used to generate names for the bucket and network security group."
  type        = string
  default     = "minecraft"
}

variable "nsg_compartment_id" {
  description = "The compartment to create the network security group in. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`."
  type        = string
  default     = null
}

variable "ssh_authorized_keys" {
  description = "The public SSH key(s) that should be authorized for the default user."
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the subnet to create the VNIC in."
  type        = string
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy the bucket is being deployed in. This is needed to configure a service account and policy for access to the bucket."
  type        = string
}

variable "vcn_id" {
  description = "The OCID of the VCN that the Network Security Group should be created on."
  type        = string
}
