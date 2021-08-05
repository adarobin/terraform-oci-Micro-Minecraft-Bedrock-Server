variable "name" {
  description = "The name of the bucket used to store backups."
  type        = string
}

variable "compartment_id" {
  description = "The compartment to create the bucket in. This must be the compartment that has the Amazon S3 Compatibility API enabled."
  type        = string
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy the bucket is being deployed in. This is needed to configure a service account and policy for access to the bucket."
  type        = string
}
