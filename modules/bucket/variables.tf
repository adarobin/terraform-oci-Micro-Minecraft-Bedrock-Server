variable "bucket_name" {
  type    = string
  default = "minecraft"
}

variable "compartment_id" {
  description = "The compartment to create the bucket in. This must be the compartment that has the Amazon S3 Compatibility API enabled. If not set, uses the root compartment (i.e. `tenancy_ocid`). Defaults to `null`."
  type        = string
  default     = null
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy the bucket is being deployed in. This is needed to configure a service account and policy for access to the bucket."
  type        = string
}
