variable "compartment_id" {
  description = "The compartment to create the Network Security Group in."
  type        = string
}

variable "display_name" {
  description = "The display name of the network security group. Defaults to \"Minecraft Network Security Group\"."
  type        = string
  default     = "Minecraft Network Security Group"
}

variable "vcn_id" {
  description = "The OCID of the VCN that the Network Security Group should be created on."
  type        = string
}
